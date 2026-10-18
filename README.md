# AZ-104 — Guía de repaso

Repositorio de estudio para el examen **Microsoft AZ-104: Azure Administrator Associate**. Contiene una guía condensada, con comparaciones, diagramas Mermaid, puntos críticos, trampas típicas y mini-escenarios, construida a partir de los módulos de Microsoft Learn y complementada con los temas del temario que esos módulos no cubren.

![Markdown](https://img.shields.io/badge/Markdown-000000?style=flat&logo=markdown&logoColor=white)
![Mermaid](https://img.shields.io/badge/Diagramas-Mermaid-ff3670?style=flat)
![AZ-104](https://img.shields.io/badge/Examen-AZ--104-0078d4?style=flat&logo=microsoftazure&logoColor=white)
![License](https://img.shields.io/badge/Licencia-MIT-green?style=flat)

## ¿Qué incluye?

| Contenido | Cantidad | Dónde |
|---|---:|---|
| Fases por módulo | 28 | [`docs/fases/`](docs/fases/) |
| Fases complementarias | 16 | [`docs/complementarias/`](docs/complementarias/) |
| Glosario de términos | 170 | [`docs/referencia/glosario.md`](docs/referencia/glosario.md) |
| Glosario de productos | 103 | [`docs/referencia/glosario-productos.md`](docs/referencia/glosario-productos.md) |
| Comparativas de productos | 15 grupos | [`docs/referencia/comparativa-productos.md`](docs/referencia/comparativa-productos.md) |
| Repaso rápido | 132 bullets | [`docs/referencia/repaso-rapido.md`](docs/referencia/repaso-rapido.md) |
| Fuentes (módulos) | 6 archivos | [`docs/fuentes/`](docs/fuentes/) |

Cada fase sigue la misma plantilla: **Si solo recuerdas 3 cosas**, comparaciones, diagrama, requisitos y restricciones, requisito → consecuencia, casos de uso, cuándo no usarlo, puntos críticos, trampa típica, mini-escenario, productos relacionados, errores comunes y checklist.

## Estructura del repositorio

```text
AZ-104/
├── README.md                  # Esta portada
├── AGENTS.md                  # Especificación del proyecto
├── mkdocs.yml                 # Configuración del sitio (GitHub Pages)
├── requirements.txt           # Dependencias de MkDocs
├── docs/
│   ├── index.md               # Portada del sitio + índice
│   ├── progreso.md            # Checklist de estudio
│   ├── fases/                 # 28 fases (una por módulo)
│   ├── complementarias/       # 16 fases complementarias
│   ├── referencia/            # Glosarios, comparativa, repaso, cobertura
│   └── fuentes/               # 6 archivos *_links.md originales
├── scripts/
│   └── validate.ps1           # Validación de Markdown/Mermaid
└── .github/workflows/         # Validación y despliegue a GitHub Pages
```

## Cómo usarlo

1. Empieza por [`docs/index.md`](docs/index.md) para ver el índice y el plan de estudio.
2. Lee la fase del módulo que estés estudiando.
3. Repasa **"Si solo recuerdas 3 cosas"** y resuelve el **mini-escenario**.
4. Marca tu avance en [`docs/progreso.md`](docs/progreso.md).
5. El día antes del examen, repasa [`docs/referencia/repaso-rapido.md`](docs/referencia/repaso-rapido.md) y los glosarios.

## Publicar en GitHub Pages

El repositorio apunta a `git@github.com:punchdll/AZ-104.git` y `mkdocs.yml` ya tiene la URL del sitio. Pasos:

1. Sube la rama principal:
   ```bash
   git push -u origin main
   ```
2. En **Settings → Pages**, selecciona **Source: GitHub Actions**.
3. El workflow `Deploy docs` publicará el sitio en `https://punchdll.github.io/AZ-104/`.

Para probarlo en local:

```bash
pip install -r requirements.txt
mkdocs serve
```

## Validación

El script [`scripts/validate.ps1`](scripts/validate.ps1) comprueba que cada fase tenga un diagrama Mermaid, que los bloques de código estén balanceados y que no haya literales `\n`. Se ejecuta en CI en cada push o pull request.

```powershell
pwsh ./scripts/validate.ps1
```

## Fuentes y aviso

El contenido se basa en los módulos y la documentación oficial de **Microsoft Learn**. Las marcas, nombres de productos y materiales de Microsoft pertenecen a Microsoft. Este repositorio es material de estudio personal y **no es un recurso oficial de Microsoft**; no garantiza aprobar el examen.

La versión del temario tomada como referencia es la publicada en la guía oficial del AZ-104 con fecha **17 de abril de 2026**.

## Licencia

El código y la estructura del repositorio se distribuyen bajo licencia **MIT** (ver [`LICENSE`](LICENSE)). El contenido de estudio se comparte con fines educativos; revisa las condiciones de uso de Microsoft Learn antes de redistribuirlo.
