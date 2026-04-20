---
decision: edicion/05-subtitulos
etapa: edicion
pregunta: ¿Cómo generas, revisas y formateas los subtítulos/closed captions cumpliendo estándares de velocidad y accesibilidad?
fuentes:
  - P1-§5.2                    # subtítulos y velocidad de lectura
  - P1-§5.3                    # posición de subtítulos
  - P1-§2.3-#3                 # redundancia (excepción para accesibilidad)
  - P2-edicion-patrones
  - P2-edicion-antipatrones    # aceptar transcripción automática sin revisar
  - P3-edicion-subtitulos      # Whisper + Aegisub + Subtitle Edit
  - P2-ficha-mouredev          # open captions por default
  - P2-ficha-dotcsv            # open captions hispano
  - P2-ficha-quantumfracture   # open captions + closed
admite-variantes: false
varia-por-eje: [plataforma]
sync: 2026-04-20
version: 2
---

## Principio aplicable

**Velocidad de lectura** [P1-§5.2]: humanos promedio leen 15-20
caracteres/segundo (CPS) en contenido de pantalla con atención dividida.
Pasar de 20 CPS excluye a parte de la audiencia; bajar de 12 CPS
subutiliza el canal y sacrifica densidad.

**Posición y legibilidad** [P1-§5.3]: subtítulos en tercio inferior,
con fondo translúcido o contorno para legibilidad sobre fondos variados.
Evitar superposición con elementos visuales clave.

**Accesibilidad** (principio externo al pilar 1 pero obligatorio):
closed captions son requisito legal y ético en muchos contextos. El
principio de redundancia [P1-§2.3-#3] NO aplica a subtítulos de
accesibilidad — son excepción explícita.

## Casos

- **MoureDev / Midudev / DotCSV / QuantumFracture** [P2-ficha-mouredev,
  P2-ficha-dotcsv, P2-ficha-quantumfracture]: open captions quemados
  por default para consumo silencioso en redes + closed captions
  paralelos para accesibilidad.
- **Whisper + revisión manual** [P3-edicion-subtitulos]: Whisper genera
  base automática de alta calidad en 95%+ de casos; falla sistemáticamente
  en jerga técnica (nombres de librerías, comandos, acrónimos) y nombres
  propios. Revisión manual es obligatoria.

## Anti-patrón

**Aceptar transcripción automática sin revisar** [P2-edicion-antipatrones]:
Whisper transcribe "useState" como "use state", "bun run" como "bang run",
etc. Publicar sin revisar degrada la utilidad de los subtítulos
precisamente para el público técnico que más los usa.

**Subtítulos a >20 CPS.** Excluye lectores lentos, no-nativos, y usuarios
con disabilities. El fix: cortar la línea antes y distribuir a la
siguiente cue, aunque eso implique ajustar timing.

**Subtítulos en posición cambiante o sobre texto en pantalla.** Rompe
legibilidad.

## Heurística numérica

- **Velocidad:** 15-20 CPS (caracteres por segundo).
- **Longitud por línea:** 37-42 caracteres máximo.
- **Líneas por cue:** máximo 2.
- **Duración en pantalla:** mínimo ~1s (incluso si el texto es corto —
  el viewer necesita tiempo para registrarlo), máximo ~7s por cue.
- **Posición:** tercio inferior centrado; fondo translúcido negro 60-70%
  opacidad o contorno de 2-3px.

## Ajuste por eje

### Por `plataforma`

- **`shorts-vertical`:** subtítulos **obligatorios siempre** (consumo silencioso default). Burned-in + closed recomendado.
- **`long-form-horizontal`:** burned-in opcional; closed captions obligatorias por accesibilidad.
- **`podcast-audio-primario`:** closed captions para la versión video secundaria; no aplican subs burned-in.
- **`live-with-vod`:** subs en vivo via auto-caption (YouTube/Twitch) + closed captions editadas en el VOD re-upload.
- **`corporate-lms`:** closed captions + transcript obligatorios por accesibilidad corporativa (WCAG + SCORM).

## Conflictos conocidos

- **Accesibilidad vs redundancia** [P1-§2.3-#3]: los subtítulos de
  accesibilidad SON redundantes con la narración pero son obligatorios.
  Mantener siempre. Esto NO es conflicto P2 vs P1 — es P1 vs
  restricción externa (legal/ético). Flaggear en notas de producción
  si alguien propone removerlos por "optimización cognitiva".

## Salida esperada

- Archivo de subtítulos (SRT/VTT/ASS) con CPS verificado.
- Log de revisión manual: lista de términos técnicos corregidos
  post-Whisper.
- Decisión open captions (sí/no) + closed captions (siempre sí).
- Nota en producción sobre la excepción de accesibilidad al principio
  de redundancia.

## Términos JS/TS/Node/web que Whisper rompe sistemáticamente

Checklist de revisión base — verificar cada uno antes de publicar:

- Runtime/herramienta: `Bun`, `Deno`, `Node.js`, `pnpm`, `yarn`, `npm`, `Vite`, `webpack`, `esbuild`, `tsc`.
- Comandos: `bun run`, `bun install`, `bun create`, `npm ci`, `git rebase`.
- APIs React: `useState`, `useEffect`, `useMemo`, `useCallback`, `useRef`.
- Archivos: `package.json`, `tsconfig.json`, `bun.lockb`, `yarn.lock`.
- Lenguajes: `TypeScript`, `JavaScript`, `Rust`, `Go`, `Python`, `Zig`.
- Conceptos: `async/await`, `JSX`, `TSX`, `CORS`, `SSR`, `CI/CD`.
- Convenciones hispanas: "hooks" (no "ganchos"), "renderizar" (no
  "renderar"), "deployar" (no "deplorar").
