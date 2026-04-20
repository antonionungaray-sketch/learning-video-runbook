---
decision: publicacion/05-programacion
etapa: publicacion
pregunta: ¿Cuándo publicar para maximizar alcance inicial?
fuentes:
  - P2-publicacion-patrones
  - P3-publicacion-analitica   # YouTube Studio Analytics
  - P3-publicacion-plataformas # YouTube / LMS scheduling
admite-variantes: false
varia-por-eje: [plataforma]
sync: 2026-04-19
version: 2
---

## Principio aplicable

**Datos propios > datos genéricos.** Guías como "mejor hora para
publicar en YouTube" son promedios de canales grandes globales; tu
audiencia particular tiene horarios propios observables en tu
YouTube Studio → Analytics → Audience → "Cuándo están los
espectadores" [P3-publicacion-analitica].

**Las primeras 24-48h determinan el momentum inicial.** Si
publicas cuando la audiencia está dormida, el boost inicial de
subs se pierde; sin ese boost, el algoritmo no tiene señal fuerte
para distribuir a audiencia similar.

## Casos

- **Creator con >500 subs y ≥3 meses de historial:** usar Audience
  Insights de YouTube Studio [P3-publicacion-analitica]. Heatmap
  muestra rangos donde la audiencia está activa. Publicar 30-60
  min antes del peak.
- **Creator nuevo sin data propia** [P2-publicacion-patrones]:
  default razonable según nicho — tutorial técnico anglo
  martes-jueves 14:00-16:00 UTC-5 (horario USA tarde); **tutorial
  técnico hispano** martes/jueves 19:00-21:00 hora España o LatAm
  según mayoría (post-trabajo); divulgación hispana sábado-domingo
  18:00-21:00 local (fin de semana); onboarding corporativo
  martes-jueves 09:00-11:00 hora de la empresa. Pivotar apenas
  haya data propia (mes 1-2).
- **Series con cadencia** [P3-publicacion-plataformas]: mantener
  día + hora consistente. La consistencia genera hábito en
  suscriptores. YouTube premia consistencia en Studio analytics
  con mejor distribución inicial.

## Anti-patrón

**Publicar en viernes/sábado noche** (en la mayoría de nichos): la
audiencia está en entretenimiento, no educación. Excepción: contenido
entertainment-ed.

**Usar "best time to post" de blogs SEO genéricos** como único
dato. Promedios de canales de millones no se transfieren a tu
audiencia específica.

**Publicar sin scheduler en horario propio activo del creador** que
no coincide con el de la audiencia. Programación scheduled >
publicación manual a las 2 AM porque el creador está despierto
editando.

## Heurística numérica

- **Ventana óptima:** 30-60 min antes del peak observado en
  Audience Insights [P3-publicacion-analitica]. Da tiempo al
  algoritmo de procesar metadata antes del peak de consumo.
- **Frecuencia mínima:** 1 video / 2-4 semanas para mantener
  hábito de suscriptor y señal al algoritmo
  [P3-publicacion-plataformas]. Menos frecuente reduce recall de
  canal.
- **Primeras 48h:** ventana crítica [P2-publicacion-patrones].
  Promoción activa (redes propias, comunidad) en ese rango
  multiplica por 1.5-3x el alcance final.

## Ajuste por eje

### Por `plataforma`

- **`long-form-horizontal`:** horario según audiencia primaria — típicamente tarde (17-21h zona horaria de la audiencia) o weekends. YouTube Studio reporta horas de pico. Schedule con 24-48h antelación para community tab notifications. Cadencia 1-2/semana o 1/mes según nicho.
- **`shorts-vertical`:** publicación frecuente (diaria o 3-5 veces/semana) — el algoritmo premia consistencia y frecuencia. Horarios de mayor scroll: 12-13h (lunch), 20-23h (evening).
- **`podcast-audio-primario`:** episodio semanal típicamente (mismo día y hora consolida hábito de escucha); Lex Fridman pública viernes, Huberman lunes. Schedule a través de Spotify/Apple con antelación.
- **`live-with-vod`:** programación anunciada con 7-14 días de antelación para construir audiencia live. Comunidad Discord/Twitter avisa. VOD re-upload 24-72h después con edición mínima o heavy (decisión del canal).
- **`corporate-lms`:** sin "horario de publicación" discovery — el curso se "lanza" internamente con comunicación via email/Slack de HR. Queda disponible permanentemente en el LMS. Versioning vía LMS admin, no re-upload.

## Conflictos conocidos

Ninguno.

## Salida esperada

- Hora y día de publicación elegidos.
- Justificación basada en datos propios (YouTube Studio screenshot
  opcional) o en heurística default si el creador es nuevo.
- Plan de promoción para las primeras 48h (qué redes, cuándo
  postear el link).
