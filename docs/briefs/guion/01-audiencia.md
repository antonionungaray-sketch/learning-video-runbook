---
decision: guion/01-audiencia
etapa: guion
pregunta: ¿Para quién es este video y qué debe poder hacer al terminar?
fuentes:
  - P1-§2.1                   # carga intrínseca y nivel previo
  - P1-§2.3-#7                # pre-entrenamiento
  - P2-meta-tutorial          # audiencias de tutorial técnico
  - P2-meta-divulgacion       # audiencias de divulgación
  - P2-meta-onboarding        # audiencias de onboarding
admite-variantes: false
sync: 2026-04-18
version: 1
---

## Principio aplicable

**Carga intrínseca ≈ complejidad del material × (1 − nivel previo del aprendiz)**
[P1-§2.1]. El nivel previo gobierna qué puede absorberse sin saturar memoria
de trabajo (~4 elementos simultáneos). Si la audiencia no tiene el
pre-entrenamiento necesario, hay que proveerlo antes del flujo principal
o bajar la complejidad — nunca ignorar el gap [P1-§2.3-#7].

**Objetivo de aprendizaje mensurable.** La audiencia sola no basta; hay que
acoplarla a una acción observable. "Entender X" no sirve — no es medible.
"Instalar X y desplegar un hello-world" sí.

## Casos

- **Fireship** [P2-ficha-fireship]: audiencia = devs que ya programan,
  buscan refrescarse rápido. Pre-entrenamiento alto asumido. Por eso WPM
  ~235 sin explicar términos básicos funciona.
- **Midudev** [P2-ficha-midudev]: audiencia = devs junior-mid hispanos.
  WPM ~188 con pausas explícitas para pre-entrenamiento on-the-fly cuando
  aparece término nuevo (npm, vite, webpack).
- **Kurzgesagt** [P2-ficha-kurzgesagt]: audiencia = público general sin
  background. Pre-entrenamiento vía animación isotype durante 60-90s
  antes del argumento central.

## Anti-patrón

**Audiencia difusa ("para todos los que quieran aprender X").** Garantiza
calibración mal. El video queda demasiado básico para los avanzados y
demasiado rápido para los novatos. Correlaciona con caídas de retention
por ambos extremos.

## Heurística numérica

- **Un objetivo por video ≤ 10 min.** Objetivos múltiples requieren
  segmentación explícita (ver brief 04-segmentacion).
- **Pre-entrenamiento:** si >20% del audio inicial explica términos, es
  señal de que la audiencia definida no coincide con la audiencia real
  del contenido.

## Conflictos conocidos

Ninguno relevante. Decisión prerequisito de todas las demás.

## Salida esperada

Dos frases:

- **Audiencia:** "[perfil con nivel previo explícito, ej. 'devs backend
  con experiencia en Node pero sin haber usado Bun']".
- **Objetivo:** "Al terminar este video, [audiencia] podrá [acción
  observable con verbo medible: instalar, reproducir, identificar,
  explicar con sus palabras]".
