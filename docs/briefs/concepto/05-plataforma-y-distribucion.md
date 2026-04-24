---
decision: concepto/05-plataforma-y-distribucion
etapa: concepto
pregunta: ¿Qué plataforma primaria y qué secundarias para distribuir este video?
fuentes:
  - P2-publicacion-patrones       # thumbnails, capítulos, CTA, sponsor
  - P2-publicacion-variantes      # variantes de funnel por nicho
  - P2-meta-tutorial              # plataformas típicas tutorial técnico
  - P2-meta-divulgacion           # plataformas típicas divulgación
  - P2-meta-onboarding            # LMS, no YouTube
  - P3-publicacion-plataformas    # capacidades técnicas por plataforma
  - P2-ficha-mike-meyers          # caso LMS / Udemy / cert
  - P2-ficha-plataformas-hispanas # caso Platzi/Crehana
admite-variantes: false
varia-por-eje: [plataforma]
sync: 2026-04-20
version: 2
---

## Principio aplicable

**La plataforma define las reglas que el packaging cumple, no al
revés** [P2-publicacion-patrones]. Thumbnails con expresión facial +
2-3 palabras grandes funcionan en YouTube; en LMS no hay thumbnail.
Capítulos marcados sirven en YouTube long-form; en Shorts no aplican.
Cross-funnel a ecosistema propio (Fireship → fireship.io, MoureDev →
mouredev.pro) funciona cuando hay canal donde el viewer puede
suscribirse; en LMS corporativo el "funnel" es el siguiente módulo.

**Onboarding corporativo no es YouTube** [P2-meta-onboarding]. La
"publicación" es dentro del LMS. El CTA es "completar quiz / pasar a
siguiente módulo", no "suscribirse". Confundir métricas de LMS con APV
de YouTube es error categorial.

La plataforma también condiciona ratio (decidido en brief 04),
duración tolerada, y si el video se consume con audio o silencioso
por default.

## Casos

- **Tutorial técnico anglo → YouTube + plataforma propia**
  [P2-meta-tutorial]: cross-funnel a curso pago o newsletter. CTA
  explícito minimal porque audiencia técnica anglo lo descuenta.
- **Tutorial técnico hispano → YouTube + Discord + curso premium**
  [P2-publicacion-variantes]: funnel a comunidad. CTA explícito más
  frecuente y aceptado culturalmente.
- **Divulgación → YouTube long + Patreon/sponsor + cross-plug podcast**
  [P2-meta-divulgacion]: 3B1B Patreon, Kurzgesagt shop, QuantumFracture
  podcast Quantum FM.
- **Onboarding → LMS corporativo** [P2-ficha-mike-meyers]: Udemy,
  LinkedIn Learning, Platzi/Crehana, o LMS interno (Articulate, SCORM).
  El syllabus oficial actúa como outline maestro.
- **Distribución multi-plataforma corporativa** [P2-ficha-plataformas-hispanas]:
  curso serial 60-120 clases, requiere quiz y certificado para cerrar
  el contrato cognitivo.

## Anti-patrón

**Diseñar para YouTube y subir tal cual al LMS** [P2-meta-onboarding].
El video con hook de 15s cae mal en LMS donde el viewer es captivo y
espera estructura formal. Mezclar "80% completion LMS" con "40% APV
YouTube" es error categorial — métricas no comparables.

**"Vamos a hacerlo viral"** sin definir nicho ni canal
[P2-publicacion-patrones]. La distribución se define aquí; postergar
rompe la relación entre packaging y ROI del CTA.

**Sponsor genérico sin afinidad temática**
[P2-publicacion-patrones]. Sponsor desconectado del tema baja
conversión y arriesga autoridad.

## Heurística numérica

- **Una primaria, hasta dos secundarias.** Mas de eso es deseo, no
  estrategia. Cada plataforma secundaria implica re-edit
  [P3-publicacion-plataformas].
- **Funnel definido = CTA específico.** Si no hay próximo paso (curso,
  Discord, newsletter, siguiente módulo LMS), el CTA es decorativo y
  sabotea el cierre.
- **Si plataforma primaria es vertical (Shorts/Reels/TikTok):**
  cross-edit horizontal raramente vale la pena por esfuerzo;
  considerar el formato vertical como destino, no como derivado.

## Ajuste por eje

### Por `plataforma`

El brief mismo define este eje. Resumen de implicaciones por valor:

- **`long-form-horizontal`:** YouTube/Vimeo 16:9, audio default activo, CTA explícito al cierre, thumbnails + capítulos. Packaging completo.
- **`shorts-vertical`:** 9:16, silencioso default, subtítulos obligatorios, CTA implícito (follow/profile), ciclo rápido. Capítulos no aplican.
- **`podcast-audio-primario`:** Spotify/Apple/Overcast primario + YouTube secundario. Capítulos en descripción críticos. Loudness podcast (-16 LUFS). Thumbnails de episodio + feed RSS.
- **`live-with-vod`:** Twitch/YouTube Live primario + VOD posterior. Doble ciclo de distribución; metadata post-hoc.
- **`corporate-lms`:** sin discovery — audiencia captiva. Packaging = metadata SCORM + quiz. Completion tracked a nivel LMS, no plataforma YT.

## Conflictos conocidos

**Cliente pide "todas las plataformas" sin presupuesto para re-edit**
[P3-publicacion-plataformas]. El mismo crudo no rinde igual en cada
plataforma — ratio, duración, captions burned-in, hook timing, todo
varía. Flaggear: o se prioriza una primaria, o se asigna recurso
para re-edit por plataforma.

## Salida esperada

Tres datos:

- **Plataforma primaria:** "[YouTube long | Shorts | LinkedIn |
  TikTok | LMS interno | Udemy/Platzi/Crehana | otro]".
- **Plataformas secundarias:** "[lista, o 'ninguna por ahora']".
- **Funnel del CTA:** "[próximo paso concreto que el viewer puede
  ejecutar, ej. 'newsletter X', 'siguiente módulo del curso Y',
  'comunidad Discord Z']".
