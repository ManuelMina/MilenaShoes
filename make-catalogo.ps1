# Genera catalogo.pdf para Milena's Shoes

$catalog = @(
  @{id=1;g="H";m="NIKE";r="AF1 SAIL RIPSTOP";t="EU 40-44";p=160000},
  @{id=2;g="M";m="ADIDAS";r="ADIDAS BOUNCE";t="EU 36-40";p=155000},
  @{id=3;g="M";m="NIKE";r="NIKE P7000";t="EU 36-39";p=150000},
  @{id=4;g="M";m="NIKE";r="METCON";t="EU 36-40";p=130000},
  @{id=5;g="M";m="NIKE";r="METCON";t="EU 36-41";p=130000},
  @{id=6;g="M";m="NIKE";r="METCON";t="EU 36-42";p=130000},
  @{id=7;g="H";m="NIKE";r="NIKE TRAIL";t="EU 40-44";p=150000},
  @{id=8;g="H";m="SKECHERS";r="SKECHERS";t="EU 40-44";p=150000},
  @{id=9;g="M";m="SKECHERS";r="SKECHERS";t="EU 36-40";p=150000},
  @{id=10;g="U";m="ADIDAS";r="ADIZERO";t="EU 36-44";p=145000},
  @{id=11;g="M";m="ADIDAS";r="ADIZERO";t="EU 36-40";p=145000},
  @{id=12;g="H";m="ASICS";r="ASICS RUN";t="EU 40-44";p=150000},
  @{id=13;g="H";m="NIKE";r="NIKE P-7000";t="EU 40-44";p=145000},
  @{id=14;g="H";m="NIKE";r="NIKE P-7000";t="EU 40-44";p=145000},
  @{id=15;g="M";m="NEW BALANCE";r="NEW BALANCE";t="EU 36-44";p=145000},
  @{id=16;g="H";m="ARMANI";r="ARMANI";t="EU 40-44";p=140000},
  @{id=17;g="H";m="ARMANI";r="ARMANI";t="EU 40-44";p=140000},
  @{id=18;g="H";m="SKECHERS";r="SKECHERS";t="EU 40-44";p=150000},
  @{id=19;g="H";m="ASICS";r="ASICS RUN";t="EU 40-44";p=140000},
  @{id=20;g="H";m="NEW BALANCE";r="NEW BALANCE";t="EU 40-44";p=140000},
  @{id=21;g="H";m="NEW BALANCE";r="NEW BALANCE RUN";t="EU 40-44";p=145000},
  @{id=22;g="H";m="COACH";r="COACH";t="EU 40-44";p=140000},
  @{id=23;g="H";m="JORDAN";r="JORDAN RETRO 1 LOW";t="EU 40-44";p=155000},
  @{id=24;g="M";m="ADIDAS";r="SAMBA";t="EU 36-39";p=160000},
  @{id=25;g="H";m="REEBOK";r="REEBOK CLUB";t="EU 40-44";p=155000},
  @{id=26;g="H";m="LACOSTE";r="LACOSTE ALPACINO";t="EU 40-44";p=155000},
  @{id=27;g="U";m="VANS";r="VANS HYLANE";t="EU 36-44";p=170000},
  @{id=28;g="U";m="VANS";r="VANS KNU";t="EU 36-44";p=160000},
  @{id=29;g="H";m="REEBOK";r="REEBOK FLOATZIG";t="EU 40-44";p=140000},
  @{id=30;g="U";m="NEW BALANCE";r="BALANCE 740";t="EU 36-44";p=135000},
  @{id=31;g="H";m="NIKE";r="ZOOM PEGASUS";t="EU 40-44";p=140000},
  @{id=32;g="M";m="NIKE";r="SB PARRA";t="EU 36-39";p=155000},
  @{id=33;g="H";m="NIKE";r="NIKE SB";t="EU 40-44";p=155000},
  @{id=34;g="H";m="LACOSTE";r="LACOSTE";t="EU 40-44";p=150000},
  @{id=35;g="U";m="NIKE";r="SB SUPREME";t="EU 36-44";p=155000},
  @{id=36;g="M";m="NIKE";r="NIKE SB";t="EU 36-40";p=155000},
  @{id=37;g="H";m="NIKE";r="AF1 SUPREME";t="EU 40-44";p=155000},
  @{id=38;g="H";m="NIKE";r="NIKE AF1";t="EU 40-44";p=155000},
  @{id=39;g="M";m="JORDAN";r="RETRO 1";t="EU 36-40";p=150000},
  @{id=40;g="U";m="LOUIS VUITTON";r="LV SKATE";t="EU 36-44";p=150000},
  @{id=41;g="U";m="NIKE";r="NIKE P-6000";t="EU 36-44";p=160000},
  @{id=42;g="M";m="NIKE";r="NIKE P-6001";t="EU 36-39";p=160000},
  @{id=43;g="U";m="NIKE";r="ZOOM HAPPY";t="EU 36-44";p=150000},
  @{id=44;g="H";m="NIKE";r="NIKE AIR MAX TN";t="EU 40-44";p=145000},
  @{id=45;g="H";m="NIKE";r="NIKE SB DUNK";t="EU 40-44";p=155000},
  @{id=46;g="H";m="NIKE";r="NIKE SB DUNK";t="EU 40-44";p=155000},
  @{id=47;g="M";m="NIKE";r="NIKE SB DUNK";t="EU 36-39";p=160000},
  @{id=48;g="H";m="JORDAN";r="JORDAN AURA";t="EU 40-44";p=170000},
  @{id=49;g="H";m="JORDAN";r="JORDAN AURA";t="EU 40-44";p=170000},
  @{id=50;g="U";m="NIKE";r="SHOX GUSANO";t="EU 36-44";p=160000},
  @{id=51;g="H";m="LE COQ SPORTIF";r="LE COQ SPORTIF";t="EU 40-44";p=150000},
  @{id=52;g="H";m="LE COQ SPORTIF";r="LE COQ SPORTIF";t="EU 40-45";p=155000},
  @{id=53;g="H";m="LE COQ SPORTIF";r="LE COQ SPORTIF";t="EU 40-46";p=155000},
  @{id=54;g="H";m="LE COQ SPORTIF";r="LE COQ SPORTIF";t="EU 40-47";p=155000},
  @{id=55;g="H";m="LE COQ SPORTIF";r="LE COQ SPORTIF";t="EU 40-48";p=155000},
  @{id=56;g="H";m="LACOSTE";r="LACOSTE TABLA";t="EU 40-44";p=160000},
  @{id=57;g="U";m="NIKE";r="NIKE AF1";t="EU 40-44";p=135000},
  @{id=58;g="M";m="NIKE";r="NIKE TRAIL";t="EU 36-39";p=145000},
  @{id=59;g="M";m="PUMA";r="PUMA PARK";t="EU 36-39";p=155000},
  @{id=60;g="U";m="PUMA";r="PUMA PARK";t="EU 36-44";p=155000},
  @{id=61;g="U";m="PUMA";r="PUMA PARK";t="EU 36-45";p=155000},
  @{id=62;g="H";m="NIKE";r="NIKE";t="EU 40-44";p=155000},
  @{id=63;g="H";m="NIKE";r="NIKE";t="EU 40-44";p=155000},
  @{id=64;g="H";m="NIKE";r="NIKE";t="EU 40-44";p=155000},
  @{id=65;g="H";m="NIKE";r="NIKE";t="EU 40-44";p=155000},
  @{id=66;g="M";m="ADIDAS";r="SUPERMAGMA";t="EU 36-39";p=170000},
  @{id=67;g="U";m="NIKE";r="INITIATOR";t="EU 36-44";p=160000},
  @{id=68;g="M";m="JORDAN";r="R1 LOW PARIS TOP";t="EU 36-39";p=160000},
  @{id=69;g="U";m="JORDAN";r="JORDAN R3 TRAVIS SCOTT";t="EU 36-44";p=160000},
  @{id=70;g="M";m="JORDAN";r="JORDAN R3";t="EU 36-39";p=170000},
  @{id=71;g="U";m="REEBOK";r="REEBOK CLUB";t="EU 36-44";p=155000},
  @{id=72;g="M";m="ADIDAS";r="ADIDAS SAMBA";t="EU 36-39";p=135000},
  @{id=73;g="M";m="PUMA";r="PUMA SUEDE XL";t="EU 36-39";p=155000},
  @{id=74;g="M";m="PUMA";r="PUMA PARK";t="EU 36-39";p=160000},
  @{id=75;g="M";m="NIKE";r="NIKE SB";t="EU 36-40";p=170000},
  @{id=76;g="M";m="NIKE";r="NIKE SB";t="EU 36-41";p=170000},
  @{id=77;g="M";m="NIKE";r="NIKE SB";t="EU 36-42";p=170000},
  @{id=78;g="M";m="NIKE";r="NIKE SB";t="EU 36-43";p=150000},
  @{id=79;g="M";m="NIKE";r="NIKE SB";t="EU 36-44";p=150000},
  @{id=80;g="M";m="NIKE";r="NIKE SB";t="EU 36-44";p=150000},
  @{id=81;g="M";m="NIKE";r="NIKE SB";t="EU 36-44";p=150000},
  @{id=82;g="M";m="NIKE";r="NIKE SB";t="EU 36-44";p=150000},
  @{id=83;g="H";m="NIKE";r="NIKE SB";t="EU 40-44";p=150000},
  @{id=84;g="H";m="GLOBE";r="GLOBE SKATE";t="EU 40-44";p=165000},
  @{id=85;g="H";m="GLOBE";r="GLOBE SKATE";t="EU 40-44";p=165000},
  @{id=86;g="H";m="GLOBE";r="GLOBE SKATE";t="EU 40-44";p=165000},
  @{id=87;g="H";m="GLOBE";r="GLOBE SKATE";t="EU 40-44";p=165000},
  @{id=88;g="H";m="VANS";r="VANS";t="EU 40-44";p=165000},
  @{id=89;g="U";m="VANS";r="VANS VISION";t="EU 36-44";p=165000},
  @{id=90;g="M";m="JORDAN";r="JORDAN RETRO 1 LOW";t="EU 36-39";p=165000},
  @{id=91;g="H";m="BROOKS";r="HYPERION MAX";t="EU 40-44";p=175000},
  @{id=92;g="H";m="BROOKS";r="HYPERION MAX";t="EU 40-44";p=175000},
  @{id=93;g="H";m="BROOKS";r="HYPERION MAX";t="EU 40-44";p=175000},
  @{id=94;g="H";m="BROOKS";r="HYPERION MAX";t="EU 40-44";p=175000},
  @{id=95;g="H";m="BROOKS";r="HYPERION MAX";t="EU 40-45";p=175000},
  @{id=96;g="M";m="PUMA";r="PUMA";t="EU 36-39";p=155000},
  @{id=97;g="H";m="NIKE";r="NIKE AIR MAX 97";t="EU 40-44";p=155000},
  @{id=98;g="H";m="NIKE";r="NIKE AIR MAX 2000";t="EU 40-44";p=165000},
  @{id=99;g="H";m="NIKE";r="NIKE AIR MAX CORRELATE";t="EU 40-44";p=155000},
  @{id=100;g="M";m="ADIDAS";r="ADIDAS SAMBA";t="EU 36-39";p=160000},
  @{id=101;g="M";m="JORDAN";r="JORDAN RETRO 1 LOW";t="EU 36-39";p=160000},
  @{id=102;g="M";m="JORDAN";r="JORDAN RETRO 1 LOW";t="EU 36-40";p=160000},
  @{id=103;g="M";m="JORDAN";r="JORDAN RETRO 1 LOW";t="EU 36-41";p=160000},
  @{id=104;g="H";m="NIKE";r="NIKE NOCTA";t="EU 40-44";p=180000},
  @{id=105;g="M";m="NIKE";r="NIKE TEKNO";t="EU 36-39";p=150000},
  @{id=106;g="H";m="NIKE";r="NIKE AF1";t="EU 40-44";p=140000},
  @{id=107;g="M";m="ADIDAS";r="SUPER STAR";t="EU 36-39";p=145000},
  @{id=108;g="M";m="NIKE";r="NIKE V2K";t="EU 36-40";p=165000},
  @{id=109;g="H";m="LE COQ SPORTIF";r="LECOQ SPORTIF";t="EU 40-44";p=160000},
  @{id=110;g="M";m="LE COQ SPORTIF";r="LECOQ SPORTIF";t="EU 36-39";p=150000},
  @{id=111;g="U";m="NIKE";r="NIKE AF1";t="EU 36-44";p=135000},
  @{id=112;g="M";m="ADIDAS";r="ADIDAS SL-72";t="EU 36-39";p=145000},
  @{id=113;g="H";m="NIKE";r="NIKE SHOX";t="EU 40-44";p=165000},
  @{id=114;g="H";m="NIKE";r="NIKE P-6000";t="EU 40-44";p=160000},
  @{id=115;g="U";m="VANS";r="VANS HYLANE";t="EU 36-44";p=155000},
  @{id=116;g="M";m="CAMPUS";r="CAMPUS";t="EU 36-39";p=160000},
  @{id=117;g="M";m="ADIDAS";r="ADIDAS SUPERMAGMA";t="EU 36-39";p=170000},
  @{id=118;g="U";m="NEW BALANCE";r="BALANCE 9060";t="EU 36-44";p=170000},
  @{id=119;g="H";m="NIKE";r="SB JARRITO";t="EU 40-44";p=160000},
  @{id=120;g="H";m="NIKE";r="SB JARRITO";t="EU 40-44";p=160000},
  @{id=121;g="H";m="DIESEL";r="DIESEL";t="EU 40-44";p=155000},
  @{id=122;g="H";m="JORDAN";r="JORDAN RETRO 11";t="EU 40-44";p=160000},
  @{id=123;g="H";m="REEBOK";r="REEBOK ANUEL";t="EU 40-44";p=145000},
  @{id=124;g="H";m="ON CLOUD";r="ON CLOUD";t="EU 36-40";p=150000},
  @{id=125;g="H";m="NIKE";r="TN PLUS";t="EU 40-44";p=165000}
)

# Build product cards HTML
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
        default { "#7ab87a" }
    }
    $priceStr = "{0:N0}" -f $p.p
    $priceStr = $priceStr.Replace(",",".")
    $ref = $p.id.ToString("D3")
    $imgSrc = "file:///C:/Users/Manuel/Downloads/MilenaShoes/assets/$($p.id).jpeg"
    $cards += @"
<div class="card">
  <div class="card-img-wrap"><img class="card-img" src="$imgSrc" alt="$($p.r)" onerror="this.style.background='#eee';this.style.display='block'"></div>
  <div class="card-body">
    <div class="card-ref">Ref. #$ref</div>
    <div class="card-name">$($p.r)</div>
    <div class="card-meta"><span class="card-talla">$($p.t)</span><span class="card-gen" style="background:$genColor">$genLabel</span></div>
    <div class="card-price">$`$$priceStr COP</div>
  </div>
</div>
"@
}

$logoSrc = "file:///C:/Users/Manuel/Downloads/MilenaShoes/assets/logo.png"

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
    <div class="cover-count">125</div>
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

$htmlPath = "C:\Users\Manuel\Downloads\MilenaShoes\catalogo-src.html"
$pdfPath  = "C:\Users\Manuel\Downloads\MilenaShoes\catalogo.pdf"

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
  Write-Host "ERROR: No se encontro Chrome ni Edge. Abre catalogo-src.html en Chrome y guarda como PDF."
  exit 1
}

Write-Host "Usando: $browser"
Write-Host "Generando PDF..."

$fileUrl = "file:///" + $htmlPath.Replace("\", "/")
& $browser --headless=new --disable-gpu --no-sandbox --print-to-pdf="$pdfPath" --no-pdf-header-footer --print-to-pdf-no-header "$fileUrl"

Start-Sleep -Seconds 3

if (Test-Path $pdfPath) {
  $size = (Get-Item $pdfPath).Length / 1KB
  Write-Host "PDF creado: $pdfPath ($([math]::Round($size,1)) KB)"
} else {
  Write-Host "No se genero el PDF. Intenta abrir $htmlPath en Chrome y Ctrl+P > Guardar como PDF."
}
