# Atlas de casos de éxito

Fichas de creators exitosos de YouTube en entrenamiento y divulgación, más el research log que trazabiliza cada claim que termina en el pilar 02.

**Alcance (v1 — 2026-04-18):** atlas completo de 3 nichos — tutorial técnico, divulgación, onboarding corporativo. 12-20 patrones estructurales en pilar 02 + fichas 1-a-1 por creator + research log append-only.

**Expansión v2 (2026-04-19 — fase 3 de la reforma a `video-explainer-guide`):** 7 nichos nuevos para cubrir las 12 modalidades declaradas en [docs/arquitectura/modalidades-y-ejes.md](../arquitectura/modalidades-y-ejes.md). Estas fichas son **ligeras** (análisis general del canal, sin observación VTT + WPM medido) — marcadas como tal para diferenciarlas de las 10 fichas pioneras. La iteración empírica queda para mantenimiento posterior vía `update-trends`.

**Estado actual (2026-04-19):**
- 10 fichas profundas (v1) + 3 clusters onboarding + 36 entries en research log.
- 14 fichas ligeras (v2) en 7 nichos nuevos. Sin entries nuevas en research log — las fichas ligeras no requieren trazabilidad hasta iteración posterior.
- 10 de 12 modalidades cubiertas (explainer-comercial y how-to pendientes de fichaje explícito; patrones actualmente inferidos desde tutorial-técnico + divulgación).

## Estructura

**v1 — fichas profundas (con research-log + observación VTT + WPM medido):**

- [research-log.md](research-log.md) — registro append-only de cada fuente consultada. 36 entries al 2026-04-18.
- [tutoriales-tecnicos.md](tutoriales-tecnicos.md) — 5 fichas (Fireship, ThePrimeagen, MoureDev, Midudev, The Coding Train).
- [divulgacion-corta.md](divulgacion-corta.md) — 5 fichas (3Blue1Brown, Veritasium, Kurzgesagt, DotCSV, QuantumFracture). El nombre mantiene "corta" por convención inicial; el contenido cubre divulgación en cualquier duración.
- [onboarding-corporativo.md](onboarding-corporativo.md) — 3 fichas/clusters (Mike Meyers / Total Seminars como arquetipo, Platzi + Crehana como plataformas hispanas, patrones microlearning transversales con métricas de industria).

**v2 — fichas ligeras (análisis general, pendiente observación VTT):**

- [documental-narrativo.md](documental-narrativo.md) — 2 fichas (Adam Curtis, Asianometry). Modalidad `documental-narrativo-pedagogico`.
- [video-ensayo.md](video-ensayo.md) — 2 fichas (Nerdwriter, Contrapoints). Modalidad `video-ensayo`.
- [periodismo-visual.md](periodismo-visual.md) — 2 fichas (Johnny Harris, Vox Atlas). Modalidad `periodismo-analitico-visual`.
- [conferencia-grabada.md](conferencia-grabada.md) — 2 fichas (Simon Sinek, Brené Brown). Modalidad `conferencia-grabada`.
- [live-stream-educativo.md](live-stream-educativo.md) — 2 fichas (Casey Muratori, Tsoding). Modalidad `live-stream-educativo`. (Referencia cruzada: ThePrimeagen modo live.)
- [podcast-audiovisual.md](podcast-audiovisual.md) — 2 fichas (Lex Fridman, Huberman Lab). Modalidad `podcast-audiovisual-educativo`.
- [personal-essay.md](personal-essay.md) — 2 fichas (Ali Abdaal, Matt D'Avella). Modalidad `personal-essay-pedagogico`.

## Reglas firmes

1. **Nada sin fecha.** Cada afirmación lleva fecha de verificación YYYY-MM-DD.
2. **Nada sin fuente.** Blog SEO genérico → rechazar. Académico, análisis industria reputado, entrevista primaria, observación estructural → aceptar (ver taxonomía en plan).
3. **Pilar 1 gana.** Cualquier patrón que contradiga los fundamentos cognitivos del pilar 1 se flaggea explícitamente y NO se aplica al pilar 02 sin discusión separada.
4. **Evidencia mensurable > opinión.** Cita textual + métrica > "lo dice tal blog".

## Origen

Esta ronda de investigación es la población inicial del pilar 02. Futuras actualizaciones incrementales se harán vía el skill [`update-trends`](../../skills/update-trends/SKILL.md). El plan rector de esta ronda está en `~/.claude/plans/adaptive-cooking-yeti.md` (privado del usuario, no versionado).
