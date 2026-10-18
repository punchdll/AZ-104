#!/usr/bin/env pwsh
# Valida las guías: bloques de código balanceados, un diagrama Mermaid por fase,
# secciones obligatorias y ausencia de literales \n.
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$phaseDirs = @(
    (Join-Path $root 'docs/fases'),
    (Join-Path $root 'docs/complementarias')
)
$requiredSections = @(
    '## Si solo recuerdas 3 cosas',
    '## Puntos críticos para el examen',
    '## Trampa típica del examen',
    '## Mini-escenario resuelto'
)
$requiredFiles = @(
    'README.md',
    'mkdocs.yml',
    'docs/index.md',
    'docs/progreso.md',
    'docs/referencia/glosario.md',
    'docs/referencia/glosario-productos.md',
    'docs/referencia/comparativa-productos.md',
    'docs/referencia/repaso-rapido.md',
    'docs/referencia/temas-no-cubiertos.md'
)

$errors = @()

foreach ($relative in $requiredFiles) {
    $path = Join-Path $root $relative
    if (-not (Test-Path -LiteralPath $path)) {
        $errors += "Falta el archivo obligatorio: $relative"
    }
}

$phaseFiles = @()
foreach ($dir in $phaseDirs) {
    if (-not (Test-Path -LiteralPath $dir)) {
        $errors += "No existe el directorio: $dir"
        continue
    }
    $phaseFiles += Get-ChildItem -LiteralPath $dir -Filter '*.md' -File
}

if ($phaseFiles.Count -eq 0) {
    $errors += 'No se encontraron archivos de fase.'
}

foreach ($file in $phaseFiles) {
    $relative = [IO.Path]::GetRelativePath($root, $file.FullName)
    $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8

    $fences = ([regex]::Matches($content, '```')).Count
    if ($fences % 2 -ne 0) {
        $errors += "${relative}: bloques de código sin cerrar ($fences vallas)."
    }

    $mermaid = ([regex]::Matches($content, '```mermaid')).Count
    if ($mermaid -ne 1) {
        $errors += "${relative}: se esperaba 1 diagrama Mermaid, hay $mermaid."
    }

    if ($content.Contains('\n')) {
        $errors += "${relative}: contiene el literal \n en lugar de un salto de línea real."
    }

    foreach ($section in $requiredSections) {
        if (-not $content.Contains($section)) {
            $errors += "${relative}: falta la sección '$section'."
        }
    }
}

$fases = @(Get-ChildItem -LiteralPath (Join-Path $root 'docs/fases') -Filter '*.md' -File).Count
$complementarias = @(Get-ChildItem -LiteralPath (Join-Path $root 'docs/complementarias') -Filter '*.md' -File).Count

Write-Host ''
Write-Host "Fases: $fases | Complementarias: $complementarias | Total: $($fases + $complementarias)"
Write-Host ''

if ($errors.Count -gt 0) {
    Write-Host "Validación fallida ($($errors.Count) errores):" -ForegroundColor Red
    foreach ($errorItem in $errors) {
        Write-Host "  - $errorItem" -ForegroundColor Red
    }
    exit 1
}

Write-Host 'OK: validación superada.' -ForegroundColor Green
