# Milena's Shoes — Contexto del Proyecto

## ¿Qué es este proyecto?
Sitio web de e-commerce para **Milena's Shoes**, tienda de zapatos deportivos importados con sede en **Cali, Colombia**. Todo el negocio opera por WhatsApp; el sitio sirve como vitrina y catálogo.

## URLs y repositorio
- **Web en producción:** https://milenashoes.online
- **Catálogo:** https://milenashoes.online/productos.html
- **Repositorio GitHub:** https://github.com/ManuelMina/MilenaShoes
- **Deploy:** GitHub Pages (rama `main` → dominio personalizado via CNAME)
- **Instagram:** @milenashoes26
- **WhatsApp:** +57 322 715 5957

## Estructura de archivos
```
MILENASHOES/
├── index.html          # Página principal (landing)
├── productos.html      # Catálogo completo con filtros y carrito
├── catalogo-src.html   # Versión fuente/borrador del catálogo
├── tarjeta-qr.html     # Tarjeta con código QR
├── CNAME               # Dominio personalizado: milenashoes.online
├── CLAUDE.md           # Este archivo
├── CHANGELOG.csv       # Historial de cambios
└── assets/
    ├── logo.png
    ├── LISTA ZAPATILLAS.xlsx   # BASE DE DATOS MAESTRA del inventario
    ├── RESENA CLIENTES.xlsx    # Reseñas de clientes
    └── 1.jpeg … 161.jpeg      # Fotos de productos (una por referencia)
```

## Base de datos del inventario
**Archivo:** `assets/LISTA ZAPATILLAS.xlsx`

**Columnas:**
| Col | Campo | Descripción |
|-----|-------|-------------|
| B | ID | Número de referencia (1–157), coincide con el nombre de la foto |
| C | Género | H = Hombre, M = Mujer, M Y H = Unisex (mapear a "U" en JS) |
| D | Marca | Nombre de la marca |
| E | Referencia | Nombre del modelo |
| F | Talla | Rango de tallas, ej: "EU 40 AL 44" |
| G | Costo | Precio de compra (NO mostrar al público) |
| H | Venta | Precio de venta al público |
| I | Disponible | S = disponible, N = agotado |

**Total actual:** 157 productos (IDs 1–157). Las fotos van del 1.jpeg al 161.jpeg.

## Catálogo en productos.html
El catálogo está **hardcodeado** en el array `CATALOG` dentro del `<script>` de `productos.html`. Para actualizar el inventario hay que:
1. Editar el Excel `LISTA ZAPATILLAS.xlsx`
2. Reflejar los cambios en el array `CATALOG` de `productos.html`
3. Hacer commit y push a GitHub

### Pendiente: integración con Google Sheets
**Meta a futuro:** reemplazar el array hardcodeado por una carga dinámica desde Google Sheets (CSV público). El flujo sería:
1. Milena edita el Google Sheet directamente
2. `productos.html` hace `fetch()` al CSV publicado del sheet al cargar la página
3. El catálogo se actualiza sin tocar código

**Formato URL Google Sheet CSV:** `https://docs.google.com/spreadsheets/d/{ID}/export?format=csv&gid=0`

## Fotos de productos
- Cada foto se llama `{id}.jpeg` y va en `assets/`
- Si se agrega una referencia nueva (ej: id 162), la foto debe llamarse `162.jpeg`
- **Para que Milena suba fotos sin ayuda técnica:** usar una carpeta compartida en **Google Drive** y sincronizarla manualmente a `assets/` antes de cada deploy

## Lógica del catálogo (productos.html)
- Filtro por género: tabs "Todos / Mujer / Hombre" — Unisex (U) aparece en ambos
- Filtro por marca: dropdown generado dinámicamente desde el CATALOG
- Carrito: permite agregar varios productos, elegir talla, y enviar pedido por WhatsApp
- El mensaje de WhatsApp incluye: número de zapato, marca, referencia, género, talla seleccionada

## Información del negocio
- **Nombre:** Milena's Shoes
- **Ciudad:** Cali, Colombia (también entregas en Jamundí)
- **Modalidad:** 100% online, pago anticipado
- **Medios de pago:** Nequi, Daviplata, transferencia bancaria (sin contraentrega ni crédito)
- **Entrega:** 1–2 días
- **Cambios:** Un cambio por talla, una sola vez
- **Rango de precios:** $130.000 – $180.000 COP

## Kit de Día de Madres (producto temporal)
- **Precio:** $178.000 COP
- **Incluye:** Zapatos + Rosa + Chocolatina + Tarjeta personalizada + Papel de regalo
- **Domicilio gratis** en Cali y Jamundí

## Cómo publicar cambios
```bash
cd C:\Users\Manuel\OneDrive\IA\MILENASHOES
git add -A
git commit -m "descripción del cambio"
git push origin main
```
GitHub Pages publica automáticamente en 1–3 minutos.

## Notas técnicas
- El sitio es **HTML/CSS/JS puro**, sin framework ni backend
- Google Analytics: ID `G-Y4XM6RVM2W`
- Google Search Console verificado
- El Schema.org JSON-LD se genera dinámicamente en JS desde el array CATALOG
- Las imágenes usan `loading="lazy"` para performance
