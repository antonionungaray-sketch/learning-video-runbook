# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Claude Code plugin (skills-only, no build tooling) that guides creators through evidence-based production of training/tutorial videos. Content and skills are in **Spanish**; match that language when writing new skill/doc content.

There is no code to build, lint, or test. Changes are docs and skill markdown.

## Three-pillar knowledge architecture

The knowledge layer under `docs/pilares/` is split by rate-of-change. Every skill recommendation must trace back to a pillar section (e.g. "pilar 1 §2.3"); never invent advice that bypasses the pillars.

- **Pilar 1 — `docs/pilares/01-fundamentos-cognitivos.md` (stable).** Peer-reviewed cognitive science: Mayer's principles, CLT, dual coding, retrieval/spacing, attention. Every claim is cited or marked as heuristic. Changes 1–2× per year. **Wins all conflicts** unless the user explicitly overrides.
- **Pilar 2 — `docs/pilares/02-tendencias-y-casos.md` (dynamic).** Current platform trends, patterns that work now, anti-patterns. Refreshed every 4–8 weeks via the `actualizar-tendencias` skill.
- **Pilar 3 — `docs/pilares/03-herramientas.md` (dynamic).** Current tools, releases, deprecations. Refreshed every 2–4 weeks via the `actualizar-herramientas` skill. Hardware-agnostic.

When pilar 2 or 3 contradicts pilar 1, **flag the conflict to the user explicitly**; do not silently apply the trend.

## Stage vistas

`docs/vistas-por-etapa/{guion,grabacion,edicion,publicacion}.md` are thin syntheses of the pillars for each production stage, each ending in a checklist. Skills lean on these; keep vistas and skills in sync when either changes.

## Skills layout (`.claude/skills/`)

- `crear-entrenamiento` — orchestrator. Identifies which stage the creator is in and delegates to one of the four stage skills below.
- `guion-entrenamiento` / `grabacion-entrenamiento` / `edicion-entrenamiento` / `publicacion-entrenamiento` — one per production stage. Each walks a fixed checklist of critical decisions, cross-references all three pillars, and outputs a documented plan or artifact.
- `actualizar-tendencias` / `actualizar-herramientas` — maintenance skills that refresh pilar 2 and pilar 3 respectively. They do web research, propose changes item-by-item for user approval, and update the "Frescura" (freshness) table at the top of the pillar doc with verification dates.

The stage skills share a strict contract: read pillars + vista → ask decision questions → propose with traceable justification → flag conflicts → end with a checklist. Preserve this shape when editing any stage skill.

## Objective technical standards (enforced by edicion)

Do not weaken these without explicit pillar-backed reason:
- Loudness: −14 LUFS (YouTube), −16 LUFS (podcast), −23 LUFS (EBU R128 broadcast); true peak ≤ −1 dBTP.
- Contrast: WCAG 2.2 AA — 4.5:1 body, 3:1 large text.
- Subtitles: 15–20 CPS, ≤ 2 lines, 37–42 chars/line.

## Plugin packaging

`.claude-plugin/marketplace.json` and `.claude-plugin/plugin.json` define this as an installable Claude Code plugin (v0.1.0, MIT). Bump `plugin.json:version` when shipping user-visible changes.

## Myths to refuse

Per pilar 1 §7, the repo explicitly rejects the "8-second attention span" claim and other pseudoscience. Don't reintroduce these in skill or doc edits — the pillar cites why they're wrong.
