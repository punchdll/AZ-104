# Temas del alcance: cobertura final

Verificación de la sección 3 del `AGENTS.md` y de la **guía oficial de habilidades medidas del AZ-104 (actualizada al 17-abr-2026)**. Tras las **16 fases complementarias**, el alcance de la sección 3 queda cubierto y los huecos detectados frente al temario oficial quedan cerrados (salvo un detalle parcial indicado abajo).

## 1. Alcance de la sección 3 (AGENTS.md)

| Bloque | Tema del alcance | Dónde se cubre |
|---|---|---|
| A | Crear y configurar NSGs y ASGs | Fase 10 |
| A | Evaluar reglas de seguridad efectivas | Fases 10 y 16 |
| A | Implementar Azure Bastion | **Fase complementaria 1** |
| A | Configurar service endpoints para PaaS | **Fase complementaria 2** |
| A | Configurar private endpoints para PaaS | **Fase complementaria 2** |
| B | Configurar Azure DNS | Fase 11 |
| B | Configurar balanceador de carga interno o público | Fase 14 |
| B | Solucionar problemas de balanceo de carga | **Fase complementaria 3** |
| C | Interpretar métricas en Azure Monitor | Fase 28 |
| C | Configurar logs en Azure Monitor | Fase 28 |
| C | Consultar y analizar logs | **Fase complementaria 4** |
| C | Configurar alertas, grupos de acción y reglas de procesamiento | **Fase complementaria 5** |
| C | Usar Azure Monitor Insights para VM, storage y redes | Fase 28 (VM) + **Fase complementaria 6** |
| C | Usar Azure Network Watcher y Connection Monitor | Fase 16 |
| D | Crear Recovery Services vault y Backup vault | Fase 26 + **Fase complementaria 7** |
| D | Crear y configurar políticas de backup | Fases 26–27 |
| D | Realizar backup y restore con Azure Backup | Fase 27 |
| D | Configurar Azure Site Recovery y ejecutar failover a región secundaria | **Fase complementaria 8** |
| D | Interpretar reportes y alertas de backup | **Fase complementaria 9** |

## 2. Huecos frente al temario oficial (cerrados con las fases 10–16)

| Dominio | Objetivo del temario | Dónde se cubre |
|---|---|---|
| Identidades/Gobierno | Costos: alertas, presupuestos y recomendaciones de Azure Advisor | **Fase complementaria 10** |
| Identidades/Gobierno | Administrar usuarios externos (B2B) | **Fase complementaria 11** |
| Identidades/Gobierno | Configurar resource locks | **Fase complementaria 12** |
| Identidades/Gobierno | Aplicar y administrar tags | **Fase complementaria 12** |
| Cómputo | Bicep: interpretar, modificar y convertir desde ARM | **Fase complementaria 13** |
| Cómputo | Encryption at host | **Fase complementaria 14** |
| Cómputo | Mover una VM a otro RG, suscripción o región | **Fase complementaria 14** (región vía Resource Mover, no con el move de RG) |
| Cómputo | Networking de App Service (VNet integration, access restrictions) | **Fase complementaria 15** |
| Cómputo | Backup de App Service | **Fase complementaria 15** |
| Cómputo | Azure Container Registry (crear y administrar) | **Fase complementaria 16** |
| Cómputo | Azure Container Apps (aprovisionar y escalar) | **Fase complementaria 16** |
| Almacenamiento | Firewalls y redes virtuales de Storage (selected networks) | **Parcial**: endpoints en comp. 2 y control de acceso/red en fase 19; la configuración específica de “selected networks” no tiene sección propia |

## 3. Fases complementarias generadas

| Fase | Tema | Fuente |
|---|---|---|
| fase-complementaria-01 | Azure Bastion | Azure Bastion docs |
| fase-complementaria-02 | Service endpoints vs Private endpoints | Virtual Network service endpoints, Private Link |
| fase-complementaria-03 | Troubleshooting de Load Balancer | Troubleshoot Azure Load Balancer, Standard LB diagnostics |
| fase-complementaria-04 | Consultar y analizar logs | Log queries in Azure Monitor |
| fase-complementaria-05 | Alertas, grupos de acción y reglas de procesamiento | Alerts overview, action groups, alert processing rules |
| fase-complementaria-06 | Monitor Insights (storage y redes) | Storage insights, Network insights |
| fase-complementaria-07 | Backup vault | Backup vaults overview |
| fase-complementaria-08 | Azure Site Recovery y failover | About Site Recovery, Azure-to-Azure quickstart |
| fase-complementaria-09 | Reportes y alertas de backup | Configure Azure Backup reports, Monitoring Azure Backup workloads |
| fase-complementaria-10 | Costos, presupuestos y Azure Advisor | Cost Management, budgets tutorial, Advisor overview |
| fase-complementaria-11 | Usuarios externos y B2B | Entra External ID, B2B collaboration |
| fase-complementaria-12 | Resource locks y tags | Lock your resources, tag resources |
| fase-complementaria-13 | Bicep | What is Bicep, decompile ARM to Bicep |
| fase-complementaria-14 | Encryption at host y mover VM | Disk encryption, move resources |
| fase-complementaria-15 | App Service networking y backup | Networking features, VNet integration, access restrictions, manage backup |
| fase-complementaria-16 | ACR y Container Apps | ACR intro, Container Apps overview, scale rules |

## 4. Mencionado pero no explicado (fuera del alcance)

- **Azure Firewall** — se menciona como servicio de la categoría *Network Security* (fases 9–10, fase complementaria 1) pero ninguna lección lo explica; no forma parte de la lista del alcance (sección 3) ni de los objetivos explícitos del temario de abril 2026.
- **VPN Gateway, ExpressRoute, Traffic Manager y Front Door** — no son objetivos explícitos de la versión actual del temario; aparecen solo como referencias cruzadas. No se consideran huecos obligatorios.

## 5. Nota sobre el examen

La cobertura de contenido está completa para el temario. Para aprobar sigue siendo necesario **práctica hands-on** (portal, CLI/PowerShell), resolver **casos de estudio** y hacer el **simulacro oficial**. El contenido de las guías no sustituye la práctica.
