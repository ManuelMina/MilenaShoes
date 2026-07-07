# Milena's Shoes — Contexto del Proyecto

## ¿Qué es este proyecto?
Sitio web de e-commerce para **Milena's Shoes**, tienda de zapatos deportivos importados con sede en **Cali, Colombia**. Todo el negocio opera por WhatsApp; el sitio sirve como vitrina y catálogo.

## URLs y repositorio
- **Web en producción:** https://milenashoes.online
- **Catálogo:** https://milenashoes.online/productos.html
- **Nosotros:** https://milenashoes.online/nosotros.html
- **Repositorio GitHub:** https://github.com/ManuelMina/MilenaShoes
- **Deploy:** GitHub Pages (rama `main` → dominio personalizado via CNAME)
- **Instagram:** @milenashoes26
- **WhatsApp:** +57 322 715 5957
- **Google Business:** https://www.google.com/maps/place/Milena%27s+Shoes/@3.4242274,-76.5204979

## Estructura de archivos
```
MILENASHOES/
├── index.html          # Página principal (landing) — v3 jun-2026
├── productos.html      # Catálogo completo con filtros y carrito
├── nosotros.html       # Página "Nosotros" — historia, valores, proceso
├── tarjeta-qr.html     # Tarjeta con código QR
├── sitemap.xml         # Sitemap actualizado (3 URLs)
├── robots.txt          # Allow all, referencia sitemap
├── CNAME               # Dominio personalizado: milenashoes.online
├── CLAUDE.md           # Este archivo
├── CHANGELOG.csv       # Historial de cambios
├── INFORME SEO/        # Auditorías generadas jun-2026
│   ├── auditoria-seo-milenashoes.html
│   └── auditoria-negocio-milenashoes.html
└── assets/
    ├── logo.webp                   # Logo (favicon + nav)
    ├── og-cover.webp               # Imagen Open Graph
    ├── banner-festivo.webp         # Banner sección festiva
    ├── Banner/
    │   ├── BANNER-PC.webp          # Banner hero — escritorio/tablet (picture > source por defecto)
    │   ├── BANNER-CEL.webp         # Banner hero — móvil (picture > source max-width:700px)
    │   ├── PROMO-1.webp … PROMO-4.webp  # Banners promocionales (medias gratis)
    ├── 1.webp … 185.webp          # Fotos de productos (WebP, numeración = ID del Excel)
    ├── galeria-1.webp … galeria-5.webp  # Fotos de galería
    └── LISTA ZAPATILLAS.xlsx       # BASE DE DATOS MAESTRA del inventario

Nota: "Sin uso/" en la raíz del proyecto guarda banners descartados (versiones viejas del hero) pendientes de revisión manual.
```

## Estructura de páginas (v3 jun-2026)

### index.html — Secciones en orden:
1. `#inicio` — Banner hero responsive (`<picture>`: BANNER-CEL.webp en móvil ≤700px, BANNER-PC.webp en el resto) — link a productos.html
2. `#novedades` — Carrusel de productos populares (15 modelos)
3. `#promociones` — Grid 2×2 de banners PROMO-1 a PROMO-4 (link a WA)
4. `#colecciones` — Cards mujer / hombre → link a productos.html?gen=M/H
5. `#festivo` — Ocasiones especiales: Cumpleaños, Aniversario, Amor y Amistad, Navidad
6. `#testimonios` — 17 reseñas Google-style (11 nuevas + 6 anteriores)
7. `#contacto` — WhatsApp + Instagram (compacto)
8. `#pagos` — Ticker animado de medios de pago

### nosotros.html — Secciones:
- Hero de la página
- Historia del negocio
- Stats: +50 clientes, 157 modelos, 4.9 estrellas, 100% online
- Nuestros valores (6 cards)
- Cómo comprar (4 pasos)
- Políticas (cambios, envíos, pagos, disponibilidad)
- CTA final

## Base de datos del inventario
**Archivo:** `assets/LISTA ZAPATILLAS.xlsx`

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

**Total actual:** 157 productos (IDs 1–157). Las fotos están en formato `.webp`.

**Al agregar un producto nuevo:** la foto debe llamarse `{id}.webp` y guardarse en `assets/`.

## Imágenes — Formato WebP (desde jun-2026)
- Todas las imágenes de productos, galería y banners se convirtieron a `.webp`
- La única excepción es `logo.png` (favicon no soporta webp en todos los navegadores)
- Al agregar imágenes nuevas, usar formato `.webp` con calidad 82

## Catálogo en productos.html
El catálogo está **hardcodeado** en el array `CATALOG` dentro del `<script>` de `productos.html`. Para actualizar el inventario hay que:
1. Editar el Excel `LISTA ZAPATILLAS.xlsx`
2. Reflejar los cambios en el array `CATALOG` de `productos.html` (extensión `.webp`)
3. Hacer commit y push a GitHub

## Lógica del catálogo (productos.html)
- Filtro por género: tabs "Todos / Mujer / Hombre" — Unisex (U) aparece en ambos
- Filtro por marca: dropdown generado dinámicamente desde el CATALOG
- Carrito: permite agregar varios productos, elegir talla, y enviar pedido por WhatsApp
- El mensaje de WhatsApp incluye: número de zapato, marca, referencia, género, talla seleccionada

## Información del negocio
- **Nombre:** Milena's Shoes
- **Ciudad:** Cali, Colombia
- **Cobertura:** Envíos a **TODO Colombia** (confirmado jun-2026). Domicilio gratis en Cali y Jamundí para kits.
- **Modalidad:** 100% online, pago anticipado. Sin contraentrega.
- **Medios de pago:** Nequi, Daviplata, transferencia bancaria (Bancolombia, Davivienda), PSE, tarjeta vía link
- **Entrega:** 1–2 días hábiles
- **Cambios:** Un cambio por talla, una sola vez. El cliente paga el envío de devolución.
- **Rango de precios:** $130.000 – $185.000 COP

## Kit de regalo (permanente)
- **Precio:** $178.000 COP
- **Incluye:** Zapatillas + Termo con medidor de temperatura + Chocolates Ferrero Rocher + 3 pares de medias
- **Presentación:** Kit Hombre y Kit Mujer (index.html sección `#festivo`, fotos en `assets/Regalos/Reg-Hombre.webp` y `Reg-Mujer.webp`)
- **Domicilio gratis** en Cali y Jamundí
- **Ocasiones:** Cumpleaños, Aniversario, Amor y Amistad, Navidad — siempre disponible

## Reseñas y reputación
- Google Business: 17 reseñas, 4.9 estrellas (jun-2026)
- Las reseñas están actualizadas en index.html (section #testimonios)
- Schema.org en index.html refleja reviewCount: 17, ratingValue: 4.9
- Acción pendiente: pedir reseña a cada cliente post-compra por WA

## SEO — Estado jun-2026
- Score SEO: 82/100 (auditoría jun-2026)
- Title: "Milena's Shoes | Zapatos Deportivos Cali Colombia" (≤60 chars)
- Sitemap: 3 URLs (index, productos, nosotros) — lastmod 2026-06-29
- robots.txt: Allow all, referencia sitemap
- Schema: Store + AggregateRating 4.9/17 reseñas
- Imágenes: WebP + ALT descriptivos en todas

## Cómo publicar cambios
```bash
cd C:\Users\Manuel\Downloads\MILENASHOES
git add -A
git commit -m "descripción del cambio"
git push origin main
```
GitHub Pages publica automáticamente en 1–3 minutos.

## Notas técnicas
- El sitio es **HTML/CSS/JS puro**, sin framework ni backend
- Google Analytics: ID `G-Y4XM6RVM2W`
- Google Search Console verificado
- Las imágenes usan `loading="lazy"` y formato `webp` para performance
- Los banners tienen prompt de WA pre-llenado con mensaje de promo
