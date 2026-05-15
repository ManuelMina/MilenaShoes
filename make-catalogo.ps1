# =============================================================
# make-catalogo.ps1  —  Milena's Shoes
# =============================================================
# Uso: clic derecho → Ejecutar con PowerShell
#      (o desde terminal: .\make-catalogo.ps1)
#
# Qué hace:
#   1. Lee el Excel "LISTA ZAPATILLAS.xlsx" (misma carpeta)
#   2. Genera un HTML + PDF con todas las zapatillas disponibles
#   3. Guarda catalogo-src.html y catalogo.pdf en la carpeta del proyecto
# =============================================================

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

$base     = Split-Path -Parent $MyInvocation.MyCommand.Path
$xlPath   = Join-Path $base "assets\LISTA ZAPATILLAS.xlsx"
$htmlPath = Join-Path $base "catalogo-src.html"
$pdfPath  = Join-Path $base "catalogo.pdf"

if (-not (Test-Path $xlPath)) {
  Write-Host "ERROR: No se encontro el Excel en $xlPath" -ForegroundColor Red
  Read-Host "Presiona Enter para cerrar"
  exit 1
}

Write-Host ""
Write-Host "Milena's Shoes — Generador de Catálogo PDF" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Leyendo: $xlPath"

# ── Leer Excel ──────────────────────────────────────────────
Add-Type -AssemblyName Microsoft.Office.Interop.Excel
$xl = New-Object -ComObject Excel.Application
$xl.Visible = $false
$xl.DisplayAlerts = $false
$wb = $xl.Workbooks.Open($xlPath, 0, $true)

$ws = $null
for ($i = 1; $i -le $wb.Sheets.Count; $i++) {
  $sh = $wb.Sheets.Item($i)
  if ($sh.Type -eq 1) { $ws = $sh; break }
}
if ($null -eq $ws) {
  Write-Host "ERROR: No se encontró hoja de datos." -ForegroundColor Red
  $wb.Close($false); $xl.Quit(); exit 1
}

# Encontrar fila de encabezados
$headerRow = $null
$colNum = $null; $colGen = $null; $colMarca = $null
$colRef = $null; $colTalla = $null; $colVenta = $null; $colDisp = $null

for ($r = 1; $r -le 5; $r++) {
  for ($c = 1; $c -le 12; $c++) {
    $v = "$($ws.Cells.Item($r,$c).Value2)".Trim().ToUpper()
    if ($v -eq "NUMERO")    { $headerRow = $r; $colNum   = $c }
    if ($v -eq "GENERO")    { $colGen    = $c }
    if ($v -eq "MARCA")     { $colMarca  = $c }
    if ($v -eq "REFERENCIA"){ $colRef    = $c }
    if ($v -eq "TALLA")     { $colTalla  = $c }
    if ($v -in @("VENTA","PRECIO")) { $colVenta = $c }
    if ($v -eq "DISPONIBLE"){ $colDisp   = $c }
  }
  if ($null -ne $headerRow) { break }
}

if ($null -eq $headerRow) {
  Write-Host "ERROR: No se encontró la fila de encabezados." -ForegroundColor Red
  $wb.Close($false); $xl.Quit(); exit 1
}

$lastRow = $ws.Cells.SpecialCells(11).Row

$catalog = @()
for ($r = ($headerRow + 1); $r -le $lastRow; $r++) {
  $num = $ws.Cells.Item($r, $colNum).Value2
  if ($num -eq $null -or "$num".Trim() -eq "") { continue }

  if ($null -ne $colDisp) {
    $disp = "$($ws.Cells.Item($r,$colDisp).Value2)".Trim().ToUpper()
    if ($disp -eq "N") { continue }
  }

  $g = "$($ws.Cells.Item($r,$colGen).Value2)".Trim()
  $gNorm = switch ($g.ToUpper()) {
    "H"     { "H" }
    "M"     { "M" }
    "M Y H" { "U" }
    default { "U" }
  }

  $p = 0
  if ($null -ne $colVenta) {
    $pv = $ws.Cells.Item($r, $colVenta).Value2
    if ($null -ne $pv) { $p = [int]$pv }
  }

  $catalog += @{
    id = [int]$num
    g  = $gNorm
    m  = "$($ws.Cells.Item($r,$colMarca).Value2)".Trim()
    r  = "$($ws.Cells.Item($r,$colRef).Value2)".Trim()
    t  = "$($ws.Cells.Item($r,$colTalla).Value2)".Trim()
    p  = $p
  }
}

$wb.Close($false)
$xl.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($xl) | Out-Null

Write-Host "Productos cargados: $($catalog.Count)" -ForegroundColor Green

# ── Generar tarjetas HTML ───────────────────────────────────
$logoSrc = "file:///" + ($base + "\assets\logo.png").Replace("\", "/")

$cards = ""
foreach ($p in $catalog) {
    $genLabel = switch ($p.g) {
        "H" { "Hombre" }
        "M" { "Mujer" }
        default { "Unisex" }
    }
    $genColor = switch ($p.g) {
        "H" { "#5b8dd9" }
        "M" { "#d96b8d" }
        default { "7ab87a" }
    }
    $priceStr = "{0:N0}" -f $p.p
    $priceStr = $priceStr.Replace(",",".")
    $ref      = $p.id.ToString("D3")
    $imgSrc   = "file:///" + ($base + "\assets\" + $p.id + ".jpeg").Replace("\", "/")
    $cards += @"
<div class="card">
  <div class="card-img-wrap"><img class="card-img" src="$imgSrc" alt="$($p.r)" onerror="this.style.background='#eee';this.style.display='block'"></div>
  <div class="card-body">
    <div class="card-ref">Ref. #$ref</div>
    <div class="card-name">$($p.r)</div>
    <div class="card-meta"><span class="card-talla">$($p.t)</span><span class="card-gen" style="background:$genColor">$genLabel</span></div>
    <div class="card-price">`$$priceStr COP</div>
  </div>
</div>
"@
}

$totalCount = $catalog.Count

$html = @"
<!DOCTYPE html>
<html lang="es-CO">
<head>
<meta charset="UTF-8">
<title>Catalogo Milena's Shoes 2026</title>
<style>
@page { size: A4; margin: 0; }
* { box-sizing: border-box; margin: 0; padding: 0; }
body { font-family: Arial, Helvetica, sans-serif; background: #fff; -webkit-print-color-adjust: exact; print-color-adjust: exact; }

/* COVER */
.cover {
  width: 210mm; height: 297mm;
  background: #0d0d0d;
  display: flex; flex-direction: column; align-items: center; justify-content: center;
  page-break-after: always; position: relative; overflow: hidden; text-align: center;
}
.cover-glow {
  position: absolute; width: 300px; height: 300px;
  background: radial-gradient(circle, rgba(201,168,76,0.18) 0%, transparent 70%);
  top: 30%; left: 50%; transform: translate(-50%,-50%);
}
.cover-logo { width: 90px; height: 90px; object-fit: contain; margin-bottom: 28px; position: relative; }
.cover-brand { font-family: Georgia,'Times New Roman',serif; font-size: 38px; font-weight: 700; color: #fff; letter-spacing: 5px; text-transform: uppercase; position: relative; margin-bottom: 6px; }
.cover-tagline { font-family: Georgia,serif; font-size: 13px; font-style: italic; color: rgba(255,255,255,0.45); letter-spacing: 3px; position: relative; margin-bottom: 36px; }
.cover-line { width: 160px; height: 1px; background: linear-gradient(90deg,transparent,rgba(201,168,76,0.85),transparent); margin: 0 auto 36px; position: relative; }
.cover-badge {
  background: rgba(201,168,76,0.08); border: 1px solid rgba(201,168,76,0.45);
  padding: 20px 44px; position: relative; margin-bottom: 36px;
}
.cover-count { font-family: Georgia,serif; font-size: 28px; color: rgba(201,168,76,0.9); font-weight: 700; }
.cover-count-label { font-size: 10px; color: rgba(255,255,255,0.35); letter-spacing: 3px; text-transform: uppercase; margin-top: 4px; }
.cover-wa { font-size: 15px; color: rgba(201,168,76,0.8); letter-spacing: 1px; position: relative; margin-bottom: 8px; font-weight: 700; }
.cover-wa-label { font-size: 9px; color: rgba(255,255,255,0.25); letter-spacing: 2px; text-transform: uppercase; position: relative; }
.cover-footer { position: absolute; bottom: 18mm; text-align: center; }
.cover-footer-text { font-size: 8px; color: rgba(255,255,255,0.2); letter-spacing: 2px; text-transform: uppercase; }

/* PAGE HEADER (repeated) */
.page-header {
  background: #0d0d0d;
  padding: 5mm 14mm;
  display: flex; align-items: center; justify-content: space-between;
  break-inside: avoid;
}
.ph-logo { height: 26px; object-fit: contain; }
.ph-title { font-family: Georgia,serif; font-size: 10px; color: rgba(255,255,255,0.5); letter-spacing: 2px; text-transform: uppercase; }
.ph-contact { font-size: 9px; color: rgba(201,168,76,0.75); letter-spacing: 1px; }

/* PRODUCT GRID */
.products { padding: 7mm 12mm 10mm; }
.grid { display: grid; grid-template-columns: repeat(3,1fr); gap: 4mm; }

.card { border: 1px solid #e0e0e0; border-radius: 3px; overflow: hidden; break-inside: avoid; page-break-inside: avoid; background: #fff; }
.card-img-wrap { width: 100%; aspect-ratio: 1/1; overflow: hidden; background: #f7f7f7; }
.card-img { width: 100%; height: 100%; object-fit: cover; display: block; }
.card-body { padding: 3.5mm 4mm 3mm; border-top: 1px solid #f0f0f0; }
.card-ref { font-size: 7.5px; color: #c0c0c0; letter-spacing: 1px; margin-bottom: 2px; }
.card-name { font-family: Georgia,serif; font-size: 9.5px; font-weight: 700; color: #111; margin-bottom: 4px; line-height: 1.3; }
.card-meta { display: flex; align-items: center; gap: 4px; margin-bottom: 4px; }
.card-talla { font-size: 7.5px; color: #888; }
.card-gen { font-size: 6.5px; font-weight: 700; color: #fff; padding: 1px 5px; border-radius: 2px; letter-spacing: 0.5px; text-transform: uppercase; }
.card-price { font-size: 12px; font-weight: 700; color: #b8962e; }

/* CONTACT PAGE */
.contact-page {
  background: #0d0d0d; padding: 20mm 24mm;
  page-break-before: always; min-height: 80mm;
  display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center;
}
.cp-logo { height: 55px; object-fit: contain; margin-bottom: 20px; }
.cp-brand { font-family: Georgia,serif; font-size: 22px; color: #fff; letter-spacing: 4px; margin-bottom: 8px; }
.cp-line { width: 100px; height: 1px; background: rgba(201,168,76,0.6); margin: 12px auto 20px; }
.cp-label { font-size: 8px; color: rgba(255,255,255,0.3); letter-spacing: 3px; text-transform: uppercase; margin-bottom: 6px; }
.cp-value { font-size: 16px; color: rgba(201,168,76,0.9); font-weight: 700; margin-bottom: 20px; letter-spacing: 1px; }
.cp-row { margin-bottom: 14px; }
.cp-ig { font-size: 12px; color: rgba(255,255,255,0.55); letter-spacing: 1px; margin-top: 4px; }
.cp-web { font-size: 11px; color: rgba(201,168,76,0.5); letter-spacing: 1px; margin-top: 8px; }
</style>
</head>
<body>

<!-- PORTADA -->
<div class="cover">
  <div class="cover-glow"></div>
  <img class="cover-logo" src="$logoSrc" alt="Milena's Shoes">
  <div class="cover-brand">Milena's Shoes</div>
  <div class="cover-tagline">Zapatos Deportivos · Cali, Colombia</div>
  <div class="cover-line"></div>
  <div class="cover-badge">
    <div class="cover-count">$totalCount</div>
    <div class="cover-count-label">Modelos disponibles · 2026</div>
  </div>
  <div class="cover-wa">+57 322 715 5957</div>
  <div class="cover-wa-label">Pedidos por WhatsApp</div>
  <div class="cover-footer">
    <div class="cover-footer-text">@milenashoes26 &nbsp;·&nbsp; milenashoes.online</div>
  </div>
</div>

<!-- ENCABEZADO DE PÁGINAS -->
<div class="page-header">
  <img class="ph-logo" src="$logoSrc" alt="Milena's Shoes">
  <div class="ph-title">Catálogo de Zapatos Deportivos · 2026</div>
  <div class="ph-contact">+57 322 715 5957</div>
</div>

<!-- PRODUCTOS -->
<div class="products">
<div class="grid">
$cards
</div>
</div>

<!-- PÁGINA FINAL DE CONTACTO -->
<div class="contact-page">
  <img class="cp-logo" src="$logoSrc" alt="Milena's Shoes">
  <div class="cp-brand">Milena's Shoes</div>
  <div class="cp-line"></div>
  <div class="cp-row">
    <div class="cp-label">Pedidos por WhatsApp</div>
    <div class="cp-value">+57 322 715 5957</div>
  </div>
  <div class="cp-row">
    <div class="cp-label">Instagram</div>
    <div class="cp-ig">@milenashoes26</div>
  </div>
  <div class="cp-web">milenashoes.online</div>
</div>

</body>
</html>
"@

$html | Out-File -Encoding utf8 $htmlPath
Write-Host "HTML generado: $htmlPath"

# Buscar Chrome o Edge
$browsers = @(
  "C:\Program Files\Google\Chrome\Application\chrome.exe",
  "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe",
  "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe",
  "C:\Program Files\Microsoft\Edge\Application\msedge.exe"
)
$browser = $browsers | Where-Object { Test-Path $_ } | Select-Object -First 1

if (-not $browser) {
  Write-Host "ERROR: No se encontro Chrome ni Edge." -ForegroundColor Red
  Write-Host "Abre $htmlPath en Chrome y guarda como PDF (Ctrl+P)." -ForegroundColor Yellow
  Read-Host "Presiona Enter para cerrar"
  exit 1
}

Write-Host "Usando: $browser"
Write-Host "Generando PDF..."

$fileUrl = "file:///" + $htmlPath.Replace("\", "/")
& $browser --headless=new --disable-gpu --no-sandbox --print-to-pdf="$pdfPath" --no-pdf-header-footer --print-to-pdf-no-header "$fileUrl"

Start-Sleep -Seconds 3

if (Test-Path $pdfPath) {
  $size = (Get-Item $pdfPath).Length / 1KB
  Write-Host "PDF creado: $pdfPath ($([math]::Round($size,1)) KB)" -ForegroundColor Green
} else {
  Write-Host "No se generó el PDF. Intenta abrir $htmlPath en Chrome y Ctrl+P > Guardar como PDF." -ForegroundColor Yellow
}

Write-Host ""
Read-Host "Presiona Enter para cerrar"
