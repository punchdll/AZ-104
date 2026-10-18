> **Nota de estructura (repositorio GitHub, 2026):** el contenido se reorganizó para publicarse como sitio MkDocs. La especificación original de este documento usa `Lecciones/` y `Guias/`; en el repositorio actual las rutas son:
> - Fuentes: `docs/fuentes/`
> - Fases por módulo: `docs/fases/`
> - Fases complementarias: `docs/complementarias/`
> - Referencia: `docs/referencia/` (glosarios, comparativa, repaso rápido y cobertura)
> - Portada e índice: `docs/index.md` y `docs/progreso.md`
>
> Las reglas de contenido, plantilla y cobertura de las secciones siguientes se mantienen vigentes.

## 1. Propósito del agente

Este agente genera una **guía de repaso concisa y memorizable** para el AZ-104, basada exclusivamente en los archivos `*_links.md` que el usuario proporcione. El objetivo no es replicar la documentación oficial, sino **condensar, comparar y visualizar** el contenido para facilitar la retención sin abrumar.

**Cobertura:** el agente repasa el contenido de **todos** los enlaces de esos archivos, **agrupados por lección** (una fase por lección). No se seleccionan ni se omiten temas por el alcance de la sección 3: ese alcance solo se usa para verificar cobertura después de leer los links.

## 2. Estructura de directorios y archivos de entrada

Estructura del proyecto:

```
AZ-104/
├── AGENTS.md
├── Lecciones/   # Entradas: un archivo *_links.md por módulo
└── Guias/       # Salidas: guías de repaso generadas por el agente
```

### 2.1 Entradas requeridas

El usuario debe proporcionar los siguientes archivos Markdown en `Lecciones/` (o indicar su ruta):

- `Lecciones/AZ-104 Prerequisites for Azure administrators_links.md`
- `Lecciones/AZ-104 Manage identities and governance in Azure_links.md`
- `Lecciones/AZ-104 Configure and manage virtual networks for Azure administrators_links.md`
- `Lecciones/AZ-104 Implement and manage storage in Azure_links.md`
- `Lecciones/AZ-104 Deploy and manage Azure compute resources_links.md`
- `Lecciones/AZ-104 Monitor and back up Azure resources_links.md`

Los nombres deben coincidir **exactamente** con los anteriores (nótese que los nombres usan espacios, no guiones bajos).

Cada archivo contiene una lista de URLs a módulos/lecciones oficiales de Microsoft Learn. **El agente no debe inventar contenido fuera de estos enlaces.** Si un tema del alcance (sección 3) no está cubierto por las lecciones, se registra en `Guias/temas-no-cubiertos.md`.

### 2.2 Salidas generadas

El agente escribe **todos** los archivos que produce en `Guias/`, creando la carpeta si no existe:

- `Guias/fase-NN-<slug-de-la-leccion>.md` — una por lección (ver sección 4).
- `Guias/glosario.md`
- `Guias/glosario-productos.md`
- `Guias/comparativa-productos.md`
- `Guias/repaso-rapido.md`
- `Guias/temas-no-cubiertos.md`

## 3. Alcance temático (criterio de verificación, no de generación)

Esta lista **no define qué escribir ni qué incluir**, sino **qué verificar** al revisar el contenido de las lecciones. **No es un filtro de inclusión:** las guías incluyen el contenido de todos los enlaces de cada lección, aunque no aparezcan en esta lista. Se aplica únicamente al leer los links para comprobar cobertura y, si un tema de la lista no está cubierto por ninguna lección, registrarlo en `Guias/temas-no-cubiertos.md`.

### Bloque A — Seguridad de red y acceso a PaaS
- Crear y configurar NSGs y ASGs.
- Evaluar reglas de seguridad efectivas en NSGs.
- Implementar Azure Bastion.
- Configurar service endpoints para PaaS.
- Configurar private endpoints para PaaS.

### Bloque B — Resolución de nombres y balanceo de carga
- Configurar Azure DNS.
- Configurar balanceador de carga interno o público.
- Solucionar problemas de balanceo de carga.

### Bloque C — Monitoreo y mantenimiento
- Interpretar métricas en Azure Monitor.
- Configurar logs en Azure Monitor.
- Consultar y analizar logs.
- Configurar alertas, grupos de acción y reglas de procesamiento.
- Usar Azure Monitor Insights para VM, storage y redes.
- Usar Azure Network Watcher y Connection Monitor.

### Bloque D — Backup y recuperación
- Crear Recovery Services vault y Backup vault.
- Crear y configurar políticas de backup.
- Realizar backup y restore con Azure Backup.
- Configurar Azure Site Recovery y ejecutar failover a región secundaria.
- Interpretar reportes y alertas de backup.

## 4. Flujo de trabajo por fases

El agente procesa el contenido en **fases secuenciales**, y **cada fase corresponde explícitamente a una lección** (módulo) listada en los archivos `Lecciones/*_links.md`. El agente debe:

1. Leer los archivos `Lecciones/*_links.md` para identificar la lista de lecciones.
2. Asignar a cada lección una fase (respetando el orden en que aparecen en los links).
3. Generar un archivo `.md` por lección en `Guias/`.

**Regla de cobertura:** cada fase se construye con el contenido de **todos** los enlaces de su lección; ninguno se descarta. El alcance de la sección 3 **no** limita el contenido de la fase: solo se verifica a posteriori al revisar los links.

**Regla de mapeo:** Si una lección cubre varios temas del alcance, se refleja en esa fase. Si un tema del alcance no aparece en ninguna lección, se registra en `Guias/temas-no-cubiertos.md`.

**Nomenclatura de archivos de fase:**
```
Guias/fase-NN-<slug-de-la-leccion>.md
```
Ejemplo: `Guias/fase-03-configure-nsg.md`, `Guias/fase-05-azure-bastion.md`.

**Regla de secuencia:** El agente no inicia una fase hasta haber completado la anterior. Al finalizar cada fase, actualiza `Guias/glosario.md`, `Guias/glosario-productos.md`, `Guias/repaso-rapido.md` y verifica cobertura del alcance.

## 5. Estructura obligatoria de cada archivo de fase

Cada archivo `.md` debe seguir esta plantilla, adaptada al tema de la lección. **Las secciones marcadas como opcionales se incluyen solo si la lección lo justifica** (no forzar tablas o escenarios vacíos).

```markdown
# Fase N: [Título de la lección]

## Si solo recuerdas 3 cosas
- [Hecho indispensable 1]
- [Hecho indispensable 2]
- [Hecho indispensable 3]

## Objetivo de repaso
[1–2 líneas: qué debe poder recordar el usuario al terminar]

## Comparaciones clave
[Tabla comparativa de servicios, SKUs, niveles, opciones. Solo si aplica.]

## Diagrama
[Diagrama Mermaid que muestre flujo, relaciones o arquitectura.]

## Requisitos y restricciones
- [Requisitos previos]
- [Límites, cuotas, licencias o SKUs relevantes]
- [Conflictos o incompatibilidades entre opciones]

## Requisito → Consecuencia   (opcional, si hay prerequisitos encadenados)
| Si… | Entonces… | Si no… |
|---|---|---|
| … | … | … |

## Casos de uso típicos
[3–5 bullets con escenarios concretos]

## Cuándo NO usar esto   (opcional, si hay anti-casos claros)
- [Anti-caso 1]
- [Anti-caso 2]
- [Anti-caso 3]

## Puntos críticos para el examen
[5–8 bullets con los hechos que más se confunden o se preguntan]

## Trampa típica del examen
[Pares confundibles, distractores, excepciones que rompen la regla. 3–5 bullets.]

## Mini-escenario resuelto
**Escenario:** [1–2 líneas]
**Respuesta:** [1 línea]
**Por qué:** [1–2 líneas]

## Productos relacionados   (opcional, si la lección introduce ≥1 producto nuevo)
[Ver secciones 7 y 7.1 — registrar productos nuevos en `Guias/glosario-productos.md` y las comparaciones con productos similares en `Guias/comparativa-productos.md`.]

## Errores comunes / troubleshooting   (opcional)
[Qué revisar cuando algo falla]

## Checklist de configuración   (opcional, solo lecciones procedimentales)
- [ ] [Campo o decisión clave 1]
- [ ] [Campo o decisión clave 2]
- [ ] …
```

**Regla de concisión:** Cada sección debe ser breve (3–8 líneas máximo salvo tablas y diagramas). Las tablas y diagramas son prioritarios sobre párrafos largos. Las secciones nuevas ("Si solo recuerdas 3 cosas", "Requisito → Consecuencia", "Cuándo NO usar esto", "Trampa típica", "Mini-escenario") son deliberadamente cortas: 1–5 líneas cada una.

## 6. Glosario acumulativo de términos técnicos

**Archivo:** `Guias/glosario.md`

- Se crea en la primera fase y se actualiza al final de cada fase.
- Contiene **solo términos técnicos específicos de Azure** que aparezcan en las fases (ej. "regla de seguridad efectiva", "RPO", "backend pool", "failover").
- Formato: `| Término | Definición breve (1 línea) | Fase donde aparece |`
- No incluye nombres de productos Azure — esos van en `Guias/glosario-productos.md`.
- No incluye términos genéricos de TI (ej. "red", "servidor") a menos que Azure los use con un significado específico.

## 7. Glosario de productos Azure

**Archivo:** `Guias/glosario-productos.md`

- Se crea en la primera fase y se actualiza al final de cada fase.
- Contiene **solo productos/servicios de Azure** que aparezcan en las fases (ej. Azure Bastion, Azure Load Balancer, Azure DNS, Recovery Services Vault, Backup Vault, Network Watcher, Connection Monitor, Azure Monitor, Log Analytics, Application Insights, Site Recovery, Private Endpoint, Service Endpoint, NSG, ASG, etc.).
- Formato:
  ```
  | Producto | Qué es (1 línea) | Categoría | Fase donde aparece |
  |---|---|---|---|
  | … | … | Red / Monitoreo / Backup / etc. | … |
  ```
- **Categorías sugeridas:** Red, Seguridad de red, Acceso a PaaS, DNS, Balanceo, Monitoreo, Backup/DR.

### 7.1 Tabla comparativa de productos similares

**Archivo:** `Guias/comparativa-productos.md`

- Se crea en la primera fase y se actualiza cuando se detecte un nuevo grupo de productos que realizan tareas similares.
- **Cuándo crear una comparativa nueva:** cuando en una fase aparezca un producto que comparte categoría o función con otro ya registrado (ej. Load Balancer vs Application Gateway vs Front Door; Service Endpoint vs Private Endpoint; Recovery Services Vault vs Backup Vault; Network Watcher vs Connection Monitor vs Azure Monitor).
- Formato por grupo:
  ```
  ## [Grupo: ej. Balanceadores de carga]
  | Producto | Capa | Alcance | Cuándo usarlo | Limitación clave |
  |---|---|---|---|---|
  | … | … | … | … | … |
  ```
- **Regla de no duplicación:** los datos comparativos van aquí, **no** se repiten completos en cada fase; en la fase se enlaza con una línea: `Ver comparativa: [grupo] en Guias/comparativa-productos.md`.
- **Regla de fuente:** la comparativa solo usa información presente en los links; si un producto similar no está en los links, no se incluye (se menciona como "no cubierto por las lecciones" si el usuario lo pregunta).

**Grupos esperados para este alcance** (se crean solo si las lecciones los introducen):
- Balanceadores: Load Balancer vs Application Gateway vs Traffic Manager vs Front Door.
- Acceso a PaaS: Service Endpoint vs Private Endpoint vs Private Link.
- Seguridad de red: NSG vs ASG vs Azure Firewall vs Bastion.
- DNS: Azure DNS público vs Private DNS Zone vs DNS privado en resolver.
- Backup/DR: Recovery Services Vault vs Backup Vault; Azure Backup vs Site Recovery.
- Monitoreo: Azure Monitor vs Log Analytics vs Application Insights vs Network Watcher vs Connection Monitor.

## 8. Repaso rápido global

**Archivo:** `Guias/repaso-rapido.md`

- Se crea en la primera fase y se actualiza al final de cada fase.
- Contiene **únicamente** los bullets de la sección "Si solo recuerdas 3 cosas" de cada fase, agrupados por fase.
- Formato:
  ```
  ## Fase N: [Título]
  - …
  - …
  - …
  ```
- Objetivo: una sola hoja de ~20–30 bullets para el último día antes del examen, sin abrir las fases.

## 9. Registro de vacíos

**Archivo:** `Guias/temas-no-cubiertos.md`

- Se actualiza al final de cada fase (o al cierre del proceso, si se prefiere una sola verificación final).
- Lista **únicamente** los temas del alcance (sección 3) que **no fueron cubiertos por ninguna lección** de los archivos `Lecciones/*_links.md`.
- Formato: `- [Tema] — [Motivo breve: ninguna lección lo trata / la lección lo menciona pero no lo explica]`
- Este archivo es para que el usuario sepa qué debe buscar por su cuenta.

## 10. Reglas de contenido

1. **No inventar.** Si un dato no está en los links proporcionados, no se escribe. Se registra en `Guias/temas-no-cubiertos.md`.
2. **Priorizar comparaciones y diagramas.** El usuario retiene mejor con tablas y flujos visuales que con texto lineal.
3. **No repetir la documentación oficial.** Si un procedimiento paso a paso ya está en el link, la guía solo menciona el resultado o la decisión clave, no los clics.
4. **Incluir solo lo que se confunde o se pregunta.** "Puntos críticos" y "Trampa típica" deben enfocarse en diferencias sutiles (ej. Service Endpoint vs Private Endpoint, Basic vs Standard LB) y en distractores del examen.
5. **Un solo mini-escenario por fase.** Si hay dos conceptos visualmente distintos, se prioriza el más representativo.
6. **Productos nuevos → `Guias/glosario-productos.md`; productos similares → `Guias/comparativa-productos.md`.** No duplicar la comparación completa dentro de la fase; solo enlazar.
7. **Idioma:** Español.
8. **Formato:** Markdown limpio, tablas alineadas, diagramas Mermaid válidos.

## 11. Diagramas Mermaid — Tipos permitidos

| Tipo | Uso recomendado |
|---|---|
| `flowchart LR` | Flujo de tráfico (ej. Internet → LB → Backend) |
| `flowchart TD` | Jerarquía de decisión (ej. ¿Público o interno?) |
| `sequenceDiagram` | Interacción entre componentes (ej. cliente → DNS → recurso) |
| `graph` | Relaciones simples entre servicios |

Mantener los diagramas pequeños (máximo 10–12 nodos). Un diagrama por fase es suficiente; solo agregar un segundo si hay dos conceptos visualmente distintos.

## 12. Secuencia de ejecución

```
1. Leer todos los archivos Lecciones/*_links.md y extraer la lista de lecciones (título + URL) y todos sus enlaces, en orden.
2. Confirmar al usuario: archivos detectados, cantidad total de lecciones y mapeo propuesto lección → fase.
3. Ejecutar Fase 1 → generar Guias/fase-01-*.md, actualizar Guias/glosario.md,
   Guias/glosario-productos.md, Guias/comparativa-productos.md (si aplica),
   Guias/repaso-rapido.md, verificar alcance.
4. Ejecutar Fase 2 → ... (repetir hasta la última lección).
5. Al finalizar, verificar cobertura completa del alcance (sección 3) y escribir/actualizar
   Guias/temas-no-cubiertos.md.
6. Mostrar resumen: fases completadas, términos en glosario, productos en glosario-productos,
   grupos en comparativa-productos, bullets en repaso-rapido, temas en el registro de vacíos.
```

## 13. Criterio de finalización

El agente termina cuando:

- Existe un archivo `Guias/fase-NN-*.md` por cada lección de los `Lecciones/*_links.md`.
- `Guias/glosario.md` contiene todos los términos técnicos introducidos.
- `Guias/glosario-productos.md` contiene todos los productos Azure mencionados.
- `Guias/comparativa-productos.md` contiene una tabla por cada grupo de productos similares que las lecciones introduzcan.
- `Guias/repaso-rapido.md` contiene los bullets "Si solo recuerdas 3 cosas" de todas las fases.
- `Guias/temas-no-cubiertos.md` refleja los temas del alcance (sección 3) no explicados por las lecciones.
- El usuario confirma que puede usar los archivos para repasar sin necesidad de volver a la documentación original para los conceptos clave.
