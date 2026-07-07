// generar-thumbs-carrusel.js — Milena's Shoes
//
// El carrusel "Disponibles ahora" (index.html) muestra fotos a 230x230px,
// pero usaba las fotos originales de assets/ (hasta 1600x1600px, ~150-240KB
// cada una). Con hasta 32 fotos animando a la vez via CSS transform, el
// telefono tiene que decodificar y mantener en memoria docenas de imagenes
// gigantes para una casilla chiquita -> en moviles se sobrecarga la memoria
// y el carrusel se congela/vacia a los pocos segundos.
//
// Este script genera copias livianas (480x480, calidad 78) en
// assets/car-thumb/ solo para las fotos que puede mostrar el carrusel
// (novedades: ids >= NEW_ARRIVALS_FROM, + los ids de respaldo FALLBACK).
//
// Uso: node generar-thumbs-carrusel.js
// Volver a correr cada vez que se agreguen nuevos "recien llegados".

const fs = require('fs');
const path = require('path');
const sharp = require('sharp');

const NEW_ARRIVALS_FROM = 186;
const FALLBACK_IDS = [1, 27, 23, 32, 50, 91, 104, 118, 108, 2, 24, 69, 163, 173, 176];
const THUMB_SIZE = 480;
const THUMB_QUALITY = 78;

const root = __dirname;
const srcDir = path.join(root, 'assets');
const outDir = path.join(root, 'assets', 'car-thumb');

if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });

const catalogo = JSON.parse(fs.readFileSync(path.join(root, 'catalogo.json'), 'utf8'));
const newArrivalIds = catalogo.map(p => p.id).filter(id => id >= NEW_ARRIVALS_FROM);
const ids = Array.from(new Set([...newArrivalIds, ...FALLBACK_IDS]));

(async () => {
  let done = 0, skipped = 0, failed = 0;
  for (const id of ids) {
    const src = path.join(srcDir, id + '.webp');
    const out = path.join(outDir, id + '.webp');
    if (!fs.existsSync(src)) { failed++; console.log('FALTA fuente:', src); continue; }
    if (fs.existsSync(out) && fs.statSync(out).mtimeMs > fs.statSync(src).mtimeMs) { skipped++; continue; }
    try {
      await sharp(src)
        .resize(THUMB_SIZE, THUMB_SIZE, { fit: 'cover' })
        .webp({ quality: THUMB_QUALITY })
        .toFile(out);
      done++;
    } catch (e) {
      failed++;
      console.log('ERROR', id, e.message);
    }
  }
  console.log(`Listo. Generados: ${done}, ya al dia: ${skipped}, fallidos: ${failed}, total: ${ids.length}`);
})();
