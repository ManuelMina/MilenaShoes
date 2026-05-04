# =============================================================
# actualizar-inventario.ps1  —  Milena's Shoes
# =============================================================
# Uso: clic derecho → Ejecutar con PowerShell
#      (o desde terminal: .\actualizar-inventario.ps1)
#
# Qué hace:
#   1. Lee el Excel "LISTA ZAPATILLAS.xlsx"
#   2. Filtra solo los que tienen DISPONIBLE = S
#   3. Genera catalogo.json (lo lee la pagina web)
#   4. Hace git add + commit + push → GitHub Pages actualizado
# =============================================================

Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

$base   = Split-Path -Parent $MyInvocation.MyCommand.Path
$xlPath = Join-Path $base "assets\LISTA ZAPATILLAS.xlsx"
$jsonPath = Join-Path $base "catalogo.json"

if (-not (Test-Path $xlPath)) {
  Write-Host "ERROR: No se encontro el Excel en $xlPath" -ForegroundColor Red
  Read-Host "Presiona Enter para cerrar"
  exit 1
}

Write-Host ""
Write-Host "Milena's Shoes — Actualizador de inventario" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Leyendo: $xlPath"

# Abrir Excel
$xl = New-Object -ComObject Excel.Application
$xl.Visible = $false
$xl.DisplayAlerts = $false
$wb = $xl.Workbooks.Open($xlPath, 0, $true)

# Encontrar la hoja (acepta cualquier nombre)
$ws = $null
for ($i = 1; $i -le $wb.Sheets.Count; $i++) {
  $sh = $wb.Sheets.Item($i)
  if ($sh.Type -eq 1) { $ws = $sh; break }
}
if ($ws -eq $null) {
  Write-Host "ERROR: No se encontro hoja de datos en el Excel." -ForegroundColor Red
  $wb.Close($false); $xl.Quit(); exit 1
}
Write-Host "Hoja encontrada: $($ws.Name)"

# Encontrar fila de encabezados (buscar NUMERO en cols 1-5, filas 1-5)
$headerRow = $null
$colNum = $null; $colGen = $null; $colMarca = $null
$colRef = $null; $colTalla = $null; $colVenta = $null; $colDisp = $null

for ($r = 1; $r -le 5; $r++) {
  for ($c = 1; $c -le 12; $c++) {
    $v = "$($ws.Cells.Item($r,$c).Value2)".Trim().ToUpper()
    if ($v -eq "NUMERO") { $headerRow = $r; $colNum = $c }
    if ($v -eq "GENERO")     { $colGen   = $c }
    if ($v -eq "MARCA")      { $colMarca = $c }
    if ($v -eq "REFERENCIA") { $colRef   = $c }
    if ($v -eq "TALLA")      { $colTalla = $c }
    if ($v -in @("VENTA","PRECIO")) { $colVenta = $c }
    if ($v -eq "DISPONIBLE") { $colDisp  = $c }
  }
  if ($headerRow -ne $null) { break }
}

if ($headerRow -eq $null) {
  Write-Host "ERROR: No se encontro la fila de encabezados." -ForegroundColor Red
  $wb.Close($false); $xl.Quit(); exit 1
}

Write-Host "Encabezados en fila $headerRow — Columnas: NUM=$colNum GEN=$colGen MARCA=$colMarca REF=$colRef TALLA=$colTalla VENTA=$colVenta DISP=$colDisp"

# Encontrar ultima fila
$lastRow = $ws.Cells.SpecialCells(11).Row

# Leer productos
$products = @()
$skipped  = 0
for ($r = ($headerRow + 1); $r -le $lastRow; $r++) {
  $num = $ws.Cells.Item($r, $colNum).Value2
  if ($num -eq $null -or "$num".Trim() -eq "") { continue }

  # Filtrar por DISPONIBLE
  if ($colDisp -ne $null) {
    $disp = "$($ws.Cells.Item($r, $colDisp).Value2)".Trim().ToUpper()
    if ($disp -eq "N") { $skipped++; continue }
  }

  $g = "$($ws.Cells.Item($r,$colGen).Value2)".Trim()
  $gNorm = switch ($g.ToUpper()) {
    "H"     { "H" }
    "M"     { "M" }
    "M Y H" { "U" }
    default { "U" }
  }

  $p = 0
  if ($colVenta -ne $null) {
    $pv = $ws.Cells.Item($r, $colVenta).Value2
    if ($pv -ne $null) { $p = [int]$pv }
  }

  $products += [ordered]@{
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

Write-Host "Productos disponibles (S): $($products.Count)"
if ($skipped -gt 0) { Write-Host "Productos ocultos (N): $skipped" -ForegroundColor Yellow }

# Generar JSON
$jsonArr = $products | ForEach-Object { [PSCustomObject]$_ }
$json = $jsonArr | ConvertTo-Json -Compress
[System.IO.File]::WriteAllText($jsonPath, $json, [System.Text.Encoding]::UTF8)
Write-Host "catalogo.json actualizado: $($products.Count) productos" -ForegroundColor Green

# Git push
Write-Host ""
Write-Host "Subiendo a GitHub..." -ForegroundColor Cyan
Set-Location $base
git add catalogo.json "assets/LISTA ZAPATILLAS.xlsx"
git commit -m "inventario: $($products.Count) productos disponibles ($(Get-Date -Format 'yyyy-MM-dd'))"
git push origin main

if ($LASTEXITCODE -eq 0) {
  Write-Host ""
  Write-Host "Listo! Los cambios se veran en milenashoes.online en ~2 minutos." -ForegroundColor Green
} else {
  Write-Host "Push fallido. Revisa la conexion o ejecuta 'git push' manualmente." -ForegroundColor Red
}

Write-Host ""
Read-Host "Presiona Enter para cerrar"
