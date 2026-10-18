# AZ-104 — Guía de repaso

> Repaso condensado para el examen **Microsoft AZ-104: Azure Administrator Associate**.
> Basado en los módulos de Microsoft Learn y en la guía oficial de habilidades medidas (**17 de abril de 2026**).

Esta guía no reproduce la documentación oficial: **condensa, compara y visualiza** lo que más se confunde y se pregunta. Cada fase incluye un diagrama Mermaid, una tabla comparativa, los puntos críticos, una trampa típica y un mini-escenario resuelto.

## Cómo usar la guía

1. Lee la **fase del módulo** que estés estudiando.
2. Repasa **"Si solo recuerdas 3 cosas"** y resuelve el **mini-escenario**.
3. Marca tu avance en [`progreso.md`](progreso.md).
4. Usa los **glosarios** y la **comparativa de productos** cuando dudes entre servicios.
5. El día antes del examen, repasa [`referencia/repaso-rapido.md`](referencia/repaso-rapido.md).

## Plan de estudio sugerido (4 semanas)

| Semana | Contenido | Fases |
|---|---|---|
| 1 | Identidades, gobernanza y fundamentos | 1–8 |
| 2 | Redes y acceso a PaaS | 9–16 + complementarias 1–3 |
| 3 | Almacenamiento y cómputo | 17–25 + complementarias 4–6, 13–16 |
| 4 | Monitorización, backup y repaso final | 26–28 + complementarias 7–12 + repaso rápido |

> Ajusta el ritmo a tu experiencia. Si ya administras Azure, dedica más tiempo a las **trampas** y a los **mini-escenarios**.

## Fases por módulo (28)

| Fase | Tema | Módulo |
|---|---|---|
| [1](fases/fase-01-intro-to-azure-cloud-shell.md) | Azure Cloud Shell | Prerequisites |
| [2](fases/fase-02-create-azure-resource-manager-template-vs-code.md) | Crear plantillas ARM con VS Code | Prerequisites |
| [3](fases/fase-03-understand-azure-active-directory.md) | Microsoft Entra ID (introducción) | Identities and governance |
| [4](fases/fase-04-create-configure-manage-identities.md) | Crear y administrar identidades | Identities and governance |
| [5](fases/fase-05-describe-core-architectural-components-of-azure.md) | Componentes arquitectónicos de Azure | Identities and governance |
| [6](fases/fase-06-sovereignty-policy-initiatives.md) | Azure Policy y gobernanza en la nube | Identities and governance |
| [7](fases/fase-07-secure-azure-resources-with-rbac.md) | Azure RBAC | Identities and governance |
| [8](fases/fase-08-allow-users-reset-their-password.md) | Autoservicio de restablecimiento de contraseña (SSPR) | Identities and governance |
| [9](fases/fase-09-configure-virtual-networks.md) | Redes virtuales y direccionamiento IP | Virtual networks |
| [10](fases/fase-10-configure-network-security-groups.md) | NSG y ASG | Virtual networks |
| [11](fases/fase-11-host-domain-azure-dns.md) | Azure DNS | Virtual networks |
| [12](fases/fase-12-configure-vnet-peering.md) | VNet peering | Virtual networks |
| [13](fases/fase-13-control-network-traffic-flow-with-routes.md) | Rutas y flujo de tráfico | Virtual networks |
| [14](fases/fase-14-intro-to-azure-load-balancer.md) | Azure Load Balancer | Virtual networks |
| [15](fases/fase-15-intro-to-azure-application-gateway.md) | Azure Application Gateway | Virtual networks |
| [16](fases/fase-16-intro-to-azure-network-watcher.md) | Azure Network Watcher | Virtual networks |
| [17](fases/fase-17-configure-storage-accounts.md) | Cuentas de almacenamiento | Storage |
| [18](fases/fase-18-configure-blob-storage.md) | Azure Blob Storage | Storage |
| [19](fases/fase-19-configure-storage-security.md) | Seguridad de Azure Storage | Storage |
| [20](fases/fase-20-configure-azure-files-file-sync.md) | Azure Files y File Sync | Storage |
| [21](fases/fase-21-intro-to-azure-virtual-machines.md) | Introducción a las VM de Azure | Compute |
| [22](fases/fase-22-configure-virtual-machine-availability.md) | Disponibilidad y escalado de VM | Compute |
| [23](fases/fase-23-configure-app-service-plans.md) | Planes de App Service | Compute |
| [24](fases/fase-24-configure-azure-app-services.md) | Azure App Service | Compute |
| [25](fases/fase-25-configure-azure-container-instances.md) | Azure Container Instances | Compute |
| [26](fases/fase-26-intro-to-azure-backup.md) | Introducción a Azure Backup | Monitor and back up |
| [27](fases/fase-27-protect-virtual-machines-with-azure-backup.md) | Proteger VM con Azure Backup | Monitor and back up |
| [28](fases/fase-28-monitor-azure-vm-using-diagnostic-data.md) | Supervisar una VM con datos de diagnóstico | Monitor and back up |

## Fases complementarias (16)

Cubren objetivos del temario oficial que los módulos no explican, además de los temas del alcance que quedaban sin desarrollar.

| Fase | Tema |
|---|---|
| [1](complementarias/fase-complementaria-01-azure-bastion.md) | Azure Bastion |
| [2](complementarias/fase-complementaria-02-service-endpoints-y-private-endpoints.md) | Service endpoints vs Private endpoints |
| [3](complementarias/fase-complementaria-03-solucion-de-problemas-de-load-balancer.md) | Troubleshooting de Load Balancer |
| [4](complementarias/fase-complementaria-04-consultar-y-analizar-logs-en-azure-monitor.md) | Consultar y analizar logs en Azure Monitor |
| [5](complementarias/fase-complementaria-05-alertas-grupos-de-accion-y-reglas-de-procesamiento.md) | Alertas, grupos de acción y reglas de procesamiento |
| [6](complementarias/fase-complementaria-06-azure-monitor-insights-storage-y-redes.md) | Azure Monitor Insights para storage y redes |
| [7](complementarias/fase-complementaria-07-backup-vault.md) | Backup vault |
| [8](complementarias/fase-complementaria-08-azure-site-recovery.md) | Azure Site Recovery y failover |
| [9](complementarias/fase-complementaria-09-reportes-y-alertas-de-backup.md) | Reportes y alertas de backup |
| [10](complementarias/fase-complementaria-10-costos-presupuestos-y-advisor.md) | Costos, presupuestos y Azure Advisor |
| [11](complementarias/fase-complementaria-11-usuarios-externos-b2b.md) | Usuarios externos y colaboración B2B |
| [12](complementarias/fase-complementaria-12-resource-locks-y-tags.md) | Resource locks y tags |
| [13](complementarias/fase-complementaria-13-bicep.md) | Bicep |
| [14](complementarias/fase-complementaria-14-encryption-at-host-y-mover-vm.md) | Encryption at host y mover una VM |
| [15](complementarias/fase-complementaria-15-app-service-networking-y-backup.md) | Networking y backup de App Service |
| [16](complementarias/fase-complementaria-16-contenedores-acr-y-container-apps.md) | Azure Container Registry y Container Apps |

## Referencia

| Archivo | Para qué sirve |
|---|---|
| [Glosario de términos](referencia/glosario.md) | Términos técnicos específicos de Azure (170) |
| [Glosario de productos](referencia/glosario-productos.md) | Productos y servicios de Azure (103) |
| [Comparativa de productos](referencia/comparativa-productos.md) | 15 grupos de productos similares |
| [Repaso rápido](referencia/repaso-rapido.md) | 132 bullets para el último día |
| [Cobertura y temas no cubiertos](referencia/temas-no-cubiertos.md) | Verificación del alcance y huecos |

## Fuentes

Los 6 archivos de enlaces originales están en `fuentes/`. Cada fase se construyó a partir de **todos** los enlaces de su módulo, más documentación oficial para las fases complementarias.

## Aviso

Material de estudio personal basado en Microsoft Learn. **No es un recurso oficial de Microsoft** ni garantiza aprobar el examen. Las marcas y materiales de Microsoft pertenecen a Microsoft.
