---
name: setup-environment
description: "Use when the user wants to configure or update their personal environment profile for the video-explainer-guide plugin — OS, preferences, hardware, and tools they already use. Creates or updates a persistent profile (global at ~/.claude/video-explainer/profile.md, with optional per-project override at ./video-explainer-profile.md) that other skills read to filter tool recommendations by platform. Re-invocable: supports partial updates of specific sections (hardware, tools, preferences)."
---

# Setup Environment — perfil de entorno del usuario

Construye y actualiza el perfil de entorno del usuario vía diálogo. El perfil dicta qué herramientas recomiendan los skills de etapa (`concept-explainer`, `record-explainer`, `edit-explainer`, `publish-explainer`) al consultar el catálogo de Pilar 3.

## Concepto — por qué existe este skill

El plugin `video-explainer-guide` recomienda herramientas concretas (editores, grabadores, VoIP, etc.) en cada etapa de producción. Sin información del entorno del usuario, las recomendaciones se apoyan en el catálogo completo — lo que significa sugerir a veces herramientas que no corren en el OS del usuario o que no encajan con su modelo de licencia/costo.

Este skill construye un perfil persistente del usuario que responde a 5 dimensiones:

1. **Plataforma** (OS, shell) — qué herramientas son binariamente compatibles.
2. **Preferencias** (open-source vs. paid, local vs. cloud, idioma UI) — qué encajan con el modelo mental del usuario.
3. **Restricciones** (conectividad, licencia corporativa, requisitos legales) — qué queda fuera aunque fuese técnicamente posible.
4. **Hardware** (RAM, GPU, mic, cámara, resolución, tableta gráfica) — qué herramientas puede correr con calidad.
5. **Herramientas ya elegidas por etapa** — qué no re-recomendar.

## Archivos del perfil

El skill escribe **uno o dos** archivos según el contexto:

- **Global por máquina** (siempre): `~/.claude/video-explainer/profile.md`. Se crea si no existe. No se commitea a ningún repo.
- **Override por proyecto** (opcional): `./video-explainer-profile.md` en el directorio de trabajo actual. Se crea solo si el usuario lo pide. Útil cuando un proyecto específico tiene restricciones distintas al resto del setup personal (ej. "este cliente exige licencia corporativa Adobe"). El override gana **campo por campo** sobre el global, no reemplaza el archivo completo.

## Formato del perfil

Frontmatter YAML + cuerpo libre:

```yaml
---
os: linux | mac | windows | wsl
shell: bash | zsh | pwsh | cmd
ram-gb: 16
gpu: "NVIDIA RTX 3070" | null
mic: "Shure SM7B" | null
camera: "Sony A7C" | null
monitor-res: "3840x2160" | null
tablet: true | false
licencia-preferida: open-source | free-tier | paid | subscription | cualquiera
modo-preferido: local | cloud | híbrido | cualquiera
conectividad: online | offline | intermitente
idioma-ui: es | en | ambos
herramientas-por-etapa:
  concepto: []
  guion: []
  grabacion: []
  edicion: []
  publicacion: []
restricciones-libres: []
actualizado: YYYY-MM-DD
version: 1
---

# Notas libres

(Cualquier detalle que no cabe en frontmatter estructurado.)
```

## Flujo

### Primera invocación — perfil no existe

1. **Detectar ausencia de perfil.** Verificar `~/.claude/video-explainer/profile.md`:

   ```bash
   test -f ~/.claude/video-explainer/profile.md && echo EXISTS || echo ABSENT
   ```

2. **Introducir el concepto al usuario** en 2-3 líneas: qué vas a construir y por qué.

3. **Diálogo por secciones.** Hacer preguntas en este orden, **una sección a la vez**, confirmando con el usuario antes de avanzar:

   **Sección 1 — Plataforma y shell:**
   - Correr el comando apropiado al OS para confirmar (no adivinar):
     - Si aparenta Unix: `uname -a && echo $SHELL`
     - Si aparenta Windows: `systeminfo | findstr /C:"OS Name" /C:"OS Version"` o `ver`
   - Confirmar con el usuario: "detecté Linux con zsh — ¿correcto?"

   **Sección 2 — Preferencias:**
   - Preguntar: "¿prefieres herramientas open-source, free-tier (con tier gratuito), paid (compra única), o subscription?"
   - Preguntar: "¿prefieres trabajar local, cloud, híbrido, o no tienes preferencia?"
   - Preguntar: "¿idioma de UI preferido?" (español / inglés / ambos)

   **Sección 3 — Restricciones:**
   - "¿Tienes restricciones de conectividad?" (online siempre / offline / intermitente)
   - "¿Hay licencias o reglas corporativas que afecten tu elección?" (texto libre, lista)
   - "¿Algo más que deba saber del contexto?" (texto libre, lista → restricciones-libres)

   **Sección 4 — Hardware:**
   - RAM: preguntar o correr `free -g` (Linux), `sysctl hw.memsize` (Mac), `wmic OS get TotalVisibleMemorySize` (Windows).
   - GPU: preguntar "¿tienes GPU discreta? ¿qué modelo?" — no intentar detectar (demasiado OS-específico).
   - Mic, cámara, monitor-res, tablet: preguntar sin detectar.

   **Sección 5 — Herramientas ya elegidas por etapa:**
   - Preguntar por cada etapa (concepto, guion, grabación, edición, publicación): "¿hay herramientas que ya sabes que vas a usar?"
   - Ofrecer sugerencias del Pilar 3 si el usuario no sabe.

4. **Mostrar resumen** del perfil construido como YAML. Pedir confirmación final.

5. **Escribir el archivo:**

   ```bash
   mkdir -p ~/.claude/video-explainer
   # Escribir el contenido al archivo profile.md
   ```

6. **Preguntar por override por proyecto:** "¿quieres crear también un override específico para este proyecto en `./video-explainer-profile.md`?" — si sí, repetir diálogo solo para las secciones a overridear.

7. **Cerrar con resumen:** "perfil guardado en `~/.claude/video-explainer/profile.md`. Cuando invoques `concept-explainer`, `record-explainer`, `edit-explainer` o `publish-explainer`, tus recomendaciones se filtrarán según este perfil."

### Re-invocación — perfil ya existe

1. **Leer perfil actual** y mostrarlo al usuario en resumen: secciones + fecha de `actualizado`.

2. **Detectar staleness:** si `actualizado` tiene más de 180 días, flaggearlo:

   > "Tu perfil tiene 7 meses sin actualizar. Recomiendo revisar al menos la sección de hardware y herramientas."

3. **Preguntar qué actualizar:**
   - Todo el perfil (repetir diálogo completo)
   - Sólo una sección (plataforma / preferencias / restricciones / hardware / herramientas)
   - Sólo un campo específico (ej. "agregar una licencia corporativa nueva")
   - Nada (cerrar)

4. **Actualizar el/los campos elegidos** via diálogo.

5. **Escribir el archivo** con `actualizado: <fecha de hoy>` y `version: <N+1>`.

## Reglas firmes

- **No empaquetar scripts OS-específicos.** Claude Code corre el comando apropiado al OS que detecta en el entorno del usuario. El skill describe *qué preguntar* y *qué verificar*, pero la ejecución es adaptativa.
- **Español de México** en prosa y preguntas, consistente con el resto del plugin.
- **No asumir.** Si un dato no es verificable sin molestar al usuario, preguntar antes que adivinar. Si es verificable con un comando rápido, confirmar con el usuario después de correr.
- **El perfil es declarativo.** No verificar activamente que las herramientas listadas estén realmente instaladas (ej. no correr `which ffmpeg`). El usuario declara, el plugin confía.
- **Herramientas fuera del catálogo Pilar 3:** si el usuario menciona una herramienta que no está en `${CLAUDE_PLUGIN_ROOT}/docs/pilares/03-herramientas.md`, avisar "esa herramienta no está en mi catálogo curado; puedes invocar `update-tools` para agregarla con ficha formal. De todos modos la guardo en tu perfil."

## Después del setup

- Si detectaste herramientas mencionadas que no están en Pilar 3, listarlas al final y ofrecer invocar `update-tools`.
- Sugerir al usuario: "puedes re-invocar `setup-environment` en cualquier momento para actualizar secciones."
