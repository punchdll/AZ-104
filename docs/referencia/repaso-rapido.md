# Repaso rápido global

Bullets "Si solo recuerdas 3 cosas" de todas las fases. Para el último día antes del examen.

## Fase 1: Azure Cloud Shell
- Azure Cloud Shell es un entorno de línea de comandos **basado en navegador** y **gestionado por Microsoft**, que siempre ofrece las versiones más recientes de Azure CLI y PowerShell.
- Al abrir una sesión se asigna una **VM temporal** preconfigurada con Bash y PowerShell; la sesión se desconecta tras **20 minutos de inactividad**.
- Los archivos se conservan en **CloudDrive** (respaldado por Azure Files, en **una sola región**); solo se permite **una sesión a la vez**.

## Fase 2: Crear plantillas ARM con VS Code
- Una plantilla ARM es un archivo **JSON declarativo** que define infraestructura y configuración; es **idempotente** (re-desplegar no cambia nada si no cambia la plantilla).
- Secciones **obligatorias**: `schema`, `contentVersion` y `resources`; `parameters`, `variables`, `functions`, `outputs` y `apiProfile` son opcionales.
- Los **parámetros** personalizan el despliegue (máx. **256**); para secretos usa `secureString`/`secureObject` y **nunca** los dejes fijos en la plantilla.

## Fase 3: Microsoft Entra ID (introducción)
- Microsoft Entra ID es un servicio de directorio **PaaS multiinquilino gestionado por Microsoft**; **no** es AD DS en una VM.
- Entra ID usa **HTTP/HTTPS** (SAML, WS-Federation, OpenID Connect, OAuth), estructura **plana** (sin OUs ni GPO) y se consulta por **REST API** (no LDAP); AD DS usa **LDAP, Kerberos, OUs y GPO**.
- **P2** = P1 + **Entra ID Protection** + **Privileged Identity Management**; **Entra Domain Services** requiere **P1/P2**.

## Fase 4: Crear y administrar identidades
- Hay **tres tipos de usuario**: **cloud identity**, **directory-synchronized** y **guest**.
- Los grupos son **security** (acceso a recursos) o **Microsoft 365** (colaboración); la pertenencia puede ser **assigned**, **dynamic user** o **dynamic device** (dynamic requiere **P1**).
- El **licenciamiento basado en grupos** exige **Entra ID P1+** (o Office 365 E3+) y una licencia por **miembro único**.

## Fase 5: Componentes arquitectónicos de Azure
- Jerarquía de administración: **grupo de administración → suscripción → grupo de recursos → recurso**; los grupos de administración se anidan hasta **6 niveles** y admiten **10,000** por directorio.
- Infraestructura física: **regiones** (≥1 datacenter) y **zonas de disponibilidad** (**mínimo 3** en regiones habilitadas); **pares de regiones** a ≥**300 millas**.
- Una **suscripción** es la unidad de facturación y de control de acceso; una **cuenta** puede tener varias suscripciones.

## Fase 6: Azure Policy y gobernanza
- **Azure Policy** compara los recursos con reglas (**definiciones**) y aplica un **efecto**; una definición es `if` (condición) + `then` (efecto).
- Una **iniciativa** (policy set) agrupa definiciones; una **asignación** define qué se evalúa y con qué `enforcementMode` (Enabled / Disabled).
- Las reglas se **heredan** por la jerarquía (**grupo de administración → suscripción → grupo de recursos**) y el escaneo automático ocurre cada **24 horas**.

## Fase 7: Azure RBAC
- Una **asignación de rol** combina **security principal (quién) + role definition (qué) + scope (dónde)**.
- Azure RBAC es un **modelo de permitir (allow)**; los **NotActions** se restan de las Actions para calcular los permisos efectivos.
- El **scope** es jerárquico (grupo de administración → suscripción → grupo de recursos → recurso) y los hijos **heredan** del padre.

## Fase 8: Autoservicio de restablecimiento de contraseña (SSPR)
- **SSPR** permite a los usuarios restablecer su contraseña sin ayuda del soporte técnico cuando no pueden iniciar sesión.
- Hay **6 métodos de autenticación** (app: notificación/código, email, teléfono móvil, teléfono de oficina, preguntas de seguridad); se recomienda habilitar **2 o más**.
- Las cuentas con **rol de administrador** siempre usan **2 métodos** y **no** pueden usar preguntas de seguridad; SSPR requiere licencia **P1/P2** (o Microsoft 365).

## Fase 9: Redes virtuales y direccionamiento IP
- Una VNet es un **aislamiento lógico** con su propio bloque **CIDR**; las subredes deben ser rangos únicos y **no solaparse** dentro de la VNet.
- Cada subred **reserva 5 direcciones**: la primera (red), la 2.ª (gateway), la 3.ª y 4.ª (DNS) y la **última** (broadcast).
- Los **IP privados** comunican dentro de Azure y con on-premises; los **IP públicos** permiten comunicación con internet; la asignación puede ser **dinámica** (predeterminada) o **estática**.

## Fase 10: Grupos de seguridad de red (NSG) y ASG
- Un **NSG** filtra tráfico con reglas **allow/deny** por **prioridad** (100–4096; menor número = mayor prioridad); se asocia a **subred** o a **NIC** (máximo uno por cada).
- Hay **reglas predeterminadas** (3 de entrada y 3 de salida) que **no se pueden eliminar**, solo anular con una regla de mayor prioridad.
- Un **ASG** agrupa VMs por carga de trabajo para usarlas como origen/destino en reglas NSG, sin depender de IPs ni de subredes.

## Fase 11: Azure DNS
- **Azure DNS** es un servicio de **hospedaje** de zonas DNS (no registra dominios); actúa como **SOA** del dominio y usa la infraestructura global de Microsoft.
- Registros comunes: **A** (nombre→IPv4), **AAAA** (IPv6), **CNAME** (alias), **MX** (correo), **TXT** (verificación), **NS** y **SOA** (creados automáticamente).
- Los **alias records** (A, AAAA, CNAME) apuntan a recursos de Azure y **actualizan el registro automáticamente** cuando cambia la IP.

## Fase 12: Emparejamiento de redes virtuales (VNet peering)
- El peering conecta dos VNets para que operen como **una sola red**, con tráfico **privado** sobre el backbone de Azure (sin internet, gateway ni cifrado).
- Puede ser **regional** (misma región) o **global** (distintas regiones); los **espacios de direcciones no deben solaparse**.
- El peering es **no transitivo**: si A↔B y B↔C, A **no** llega a C automáticamente.

## Fase 13: Controlar el flujo de tráfico de red con rutas
- Azure enruta el tráfico automáticamente con **rutas del sistema** (no se crean ni eliminan); puedes **anularlas** con **rutas definidas por el usuario (UDR)**.
- Un **NVA (appliance virtual de red)** es una VM que controla el flujo de tráfico; suele requerir **IP forwarding** habilitado.
- Si hay varias rutas, Azure usa el **prefijo más largo**; ante **igual prefijo**, el orden es **UDR > BGP > rutas del sistema**.

## Fase 14: Azure Load Balancer
- Azure Load Balancer es un servicio de balanceo de **capa 4 (TCP/UDP)**, de **ultra baja latencia**, **regional** y **con redundancia de zona**.
- Puede ser **público** (equilibra tráfico de internet y da salida) o **interno/privado** (tráfico dentro de la VNet o desde on-premises).
- Trabaja con **reglas de balanceo**, **sondeos de estado (health probes)** y **reglas NAT de entrada** para administración (RDP/SSH).

## Fase 15: Azure Application Gateway
- Application Gateway es un **ADC como servicio** que hace balanceo de **capa 7 (HTTP/HTTPS/HTTP2/WebSocket)** y es **regional**.
- Ofrece **terminación TLS/SSL**, **WAF** (contra inyección SQL y XSS), **autoscaling**, **connection draining** y **afinidad de sesión**.
- Equilibra en **round-robin** hacia el **backend pool** (VMs, VMSS, App Service, on-premises).

## Fase 16: Azure Network Watcher
- Network Watcher es un conjunto de herramientas para **monitorizar, diagnosticar, ver métricas y habilitar/deshabilitar logs** de recursos de **IaaS** (no PaaS ni analítica web).
- Se organiza en **tres grupos**: **Monitoring** (topología y connection monitor), **Network diagnostic** (7 herramientas) y **Traffic** (flow logs y traffic analytics).
- Diagnostica bloqueos con **IP flow verify / NSG diagnostics**, ruteo con **next hop** y tráfico con **flow logs / traffic analytics**; **Connection monitor** comprueba conectividad extremo a extremo.

## Fase 17: Cuentas de almacenamiento
- Azure Storage admite **tres categorías de datos**: estructurados (Table/Cosmos/SQL), no estructurados (Blob/Data Lake) y datos de VM (Managed Disks/Files).
- El tipo de cuenta recomendado es **Standard general-purpose v2 (GPv2)**; existen además **Premium block blobs**, **Premium file shares** y **Premium page blobs**. **No** se puede convertir Standard ↔ Premium.
- La replicación determina la durabilidad: **LRS < ZRS < GRS < RA-GRS**, y **GZRS/RA-GZRS** combinan zonas + región.

## Fase 18: Azure Blob Storage
- Blob Storage almacena datos **no estructurados** como objetos; la jerarquía es **cuenta → contenedor → blob** (un blob **no** puede existir fuera de un contenedor).
- Los niveles de acceso son **Hot, Cool, Cold y Archive**; cuanto más «frío», menor coste de almacenamiento y mayor coste de acceso y latencia (Archive exige **rehidratar**).
- Hay **tres tipos de blob**: **block** (predeterminado), **append** (logs) y **page** (discos de VM, hasta 8 TB).

## Fase 19: Seguridad de Azure Storage
- Todo lo escrito en Azure Storage se cifra con **SSE (AES-256)** en reposo, automáticamente y **no se puede deshabilitar**; en tránsito se exige **HTTPS** (*Secure transfer required*).
- Estrategias de autorización: **Microsoft Entra ID + RBAC** (recomendado), **Shared Key**, **SAS** y **acceso anónimo** (deshabilitado por defecto).
- Una **SAS** es un **URI** con permisos restringidos y tiempo limitado; existen **user delegation SAS**, **account-level**, **service-level** y **stored access policies**.

## Fase 20: Azure Files y Azure File Sync
- Azure Files ofrece **recursos compartidos administrados** accesibles por **SMB, NFS y REST**; una compartición **no** puede usar SMB y NFS a la vez.
- Los niveles de compartición son **Premium (SSD, aprovisionado)**, **Transaction Optimized, Hot y Cool** (HDD, pago por uso).
- **Azure File Sync** convierte un **Windows Server** en **caché** de Azure Files, con **cloud tiering** para mover datos antiguos a Azure.

## Fase 21: Introducción a las máquinas virtuales de Azure
- Una VM de Azure necesita varios **recursos de apoyo**: red virtual, NIC, NSG, direcciones IP (pública/privada) y discos (SO + datos).
- Antes de crear una VM conviene planificar **red, nombre, región, tamaño, discos y SO**; el nombre (≤64 en Linux, ≤15 en Windows) es el nombre del equipo y no se cambia fácilmente.
- La facturación se separa en **cómputo** (se puede parar/desasignar) y **almacenamiento** (se cobra aunque la VM esté detenida); las **Reserved Instances** ahorran hasta un 72 %.

## Fase 22: Disponibilidad y escalado de máquinas virtuales
- Un **availability set** distribuye las VMs entre **dominios de error** y **dominios de actualización**; una VM **solo** entra al conjunto **al crearla**.
- Las **zonas de disponibilidad** (mínimo **3** por región habilitada) protegen contra el fallo de un **datacenter** completo, más que un availability set.
- **Escalado vertical = cambiar el tamaño** de la VM (scale up/down); **horizontal = cambiar el número de instancias** (scale out/in) con **VM Scale Sets** y **autoscale**.

## Fase 23: Planes de Azure App Service
- Un **App Service plan** define los **recursos de cómputo** (SO, región, nivel de precios, tamaño y número de instancias) donde corren una o varias aplicaciones; es la **unidad de escala**.
- Los niveles se agrupan en **Shared** (Free/Shared; sin SLA, solo dev/test), **Dedicated** (Basic/Standard/Premium/PremiumV2/PremiumV3) e **Isolated/IsolatedV2** (aislamiento de red).
- **Scale up (vertical)** = cambiar de **nivel de precios**; **scale out (horizontal)** = aumentar el **número de instancias** (manual o con autoscale).

## Fase 24: Azure App Service
- Azure App Service es una plataforma **PaaS** para apps web, backends móviles y API; admite **Windows y Linux** y lenguajes como ASP.NET, Java, Node.js, PHP y Python.
- Los **deployment slots** son apps activas con su propio hostname; se usan para **validar** y hacer **swap** a producción sin downtime (solo en **Standard, Premium e Isolated**).
- El acceso seguro usa un **módulo de autenticación integrado** (sin SDK) y la monitorización se hace con **Application Insights**.

## Fase 25: Azure Container Instances (y contenedores)
- **ACI** es la forma **más rápida y simple** de ejecutar un contenedor en Azure, sin gestionar VMs ni adoptar un servicio mayor.
- El recurso de nivel superior es el **container group**: contenedores en el **mismo host** que comparten ciclo de vida, recursos, red local y volúmenes (similar a un **pod** de Kubernetes).
- Azure ofrece varios servicios: **ACI** (tareas aisladas y efímeras), **Azure Container Apps** (microservicios serverless) y **AKS** (control total de Kubernetes).

## Fase 26: Introducción a Azure Backup
- Azure Backup es un servicio **sin infraestructura propia** que ofrece copias **seguras, rentables y centralizadas** para recursos de Azure (VMs, discos, SQL/SAP, Azure Files, blobs).
- Usa **almacenes (vaults)**: **Recovery Services vault** (VMs, SQL en VM, SAP HANA, Azure Files, blobs) y **Backup vault** (Azure Disks, blobs, PostgreSQL…).
- El modelo es **basado en directivas (policy)** y **basado en instantáneas (snapshot)**, con **replicación a un vault** y **planes de retención** de corto y largo plazo.

## Fase 27: Proteger máquinas virtuales con Azure Backup
- Backup de VM guarda **instantáneas (snapshots)** en el almacenamiento del recurso y las **transfiere al vault** según la **directiva**.
- De forma predeterminada los backups son **independientes y sin conocimiento de la aplicación**, pero se puede **habilitar la coherencia de aplicaciones** (VSS / pre-post scripts).
- Existen varios **tipos de restauración**: crear una **nueva VM**, **restaurar discos**, **reemplazar discos** y **restauración de archivos (File Recovery)**.

## Fase 28: Supervisar una VM de Azure con datos de diagnóstico
- **Azure Monitor** es la solución integral (recursos de Azure y no Azure) con **dos características principales**: **métricas** (retención ~**93 días**) y **logs**.
- Se distinguen **métricas de host** (del host de la VM, sin agente) y **métricas de invitado** (del SO, requieren **agente de diagnóstico**).
- **VM Insights** incorpora Azure Monitor para VM y **Map** (dependencias); los **logs** se recopilan con el **agente (AMA) + regla de recopilación de datos (DCR)** hacia **Log Analytics**.

---

# Repaso rápido — Fases complementarias

## Fase complementaria 1: Azure Bastion
- Azure Bastion es un servicio **PaaS administrado** que da **RDP/SSH sobre TLS (443)** a las VMs de una VNet, **sin** IP pública, agente ni cliente en la VM.
- Requiere la subred dedicada **`AzureBastionSubnet` (/26 o mayor)** y, salvo Developer/private-only, una **IP pública Standard estática**.
- **4 SKU** (Developer, Basic, Standard, Premium); solo **Premium** añade **session recording** y **private-only**.

## Fase complementaria 2: Service endpoints vs Private endpoints
- Los **service endpoints** extienden la **identidad de la VNet** al servicio PaaS por el backbone; el servicio **sigue teniendo endpoint público** (restringido).
- Los **private endpoints** crean una **IP privada en tu VNet** (Private Link), **sin** exponer el servicio a internet.
- Microsoft **recomienda Private Link**; private endpoints requieren **DNS privado** y no sirven service endpoints para tráfico desde **on-premises**.

## Fase complementaria 3: Solución de problemas de Load Balancer
- Standard Load Balancer expone **métricas multidimensionales + alertas** y **Resource health**; **Basic no** soporta métricas multidimensionales.
- **Data Path Availability** (plataforma) y **Health Probe Status** (instancias) combinadas **aíslan** el fallo.
- **Fallos de SNAT > 0** = agotamiento de puertos SNAT; usa **NAT Gateway** para más capacidad.

## Fase complementaria 4: Consultar y analizar logs
- **Azure Monitor Logs** usa **KQL** (basado en Azure Data Explorer); **Log Analytics** es el lugar para **escribir y probar** consultas.
- La misma consulta alimenta **alertas de búsqueda de logs, workbooks, dashboards, Logic Apps, PowerShell y la API**.
- Operadores **exclusivos** de Azure Monitor: `workspace()`, `app()`, `resource()`.

## Fase complementaria 5: Alertas, grupos de acción y reglas de procesamiento
- Una **regla de alerta** = **recursos + señal + condición**; al disparar ejecuta su **grupo de acción** y cambia de estado.
- Un **grupo de acción** define notificaciones (email, SMS, voz, push) y acciones (runbook, Function, Logic App, webhook, Event Hubs, ITSM); hasta **5** por regla.
- Las **reglas de procesamiento** **no** generan alertas: **modifican las disparadas** (añaden/suprimen grupos, filtros y horarios).

## Fase complementaria 6: Monitor Insights (storage y redes)
- **Storage insights** y **Network insights** son parte de **Azure Monitor Insights** y **no requieren configuración**.
- **Storage insights** da rendimiento, capacidad y disponibilidad de cuentas de almacenamiento (workbooks de Overview/Capacity/Availability/Performance/Failures).
- **Network insights** ofrece **Topology, Network health, Connectivity (Connection Monitor), Traffic (flow logs/Analytics)** y **Diagnostic Toolkit**.

## Fase complementaria 7: Backup vault
- El **Backup vault** (ARM) guarda copias de workloads recientes: **Azure Blob, PostgreSQL, Azure Disks**.
- Ofrece **aislamiento de datos** (suscripción/inquilino gestionado por Microsoft) y **RBAC** con **managed identities** (system/user-assigned).
- Cifrado **Microsoft-managed** por defecto o **Customer-managed (Key Vault)**; **Cross Region Restore** para PostgreSQL.

## Fase complementaria 8: Azure Site Recovery
- **ASR** da **replicación continua, failover y recuperación** (BCDR) entre regiones y desde on-premises, cumpliendo **RPO/RTO**.
- **Test failover** prueba la DR **sin** interrumpir la replicación; los **recovery plans** secuencian apps multitier.
- **Failover planificado = cero pérdida**; **failover no planificado** = pérdida mínima; luego **failback**.

## Fase complementaria 9: Reportes y alertas de backup
- Los **reportes de backup** usan **Azure Monitor Logs + workbooks**: crea un **workspace de Log Analytics** y envía los **diagnostics** de los vaults.
- **No** se muestra el **día parcial**; la ingesta inicial tarda hasta **24 h** (revisar a los 2 días); retención por defecto **30 días**.
- La **monitorización integrada** (alertas, jobs, seguridad, uso) está en **Resiliency** y en los **vaults**.

## Fase complementaria 10: Costos, presupuestos y Azure Advisor
- **Microsoft Cost Management** analiza, monitorea y optimiza costos; **Budgets** alertan (real o previsto) pero **no bloquean** recursos.
- Alertas de costo: **budget, anomaly (solo suscripciones), scheduled, EA commitment balance, invoice**; action groups solo en **suscripción/RG**.
- **Azure Advisor** recomienda en **5 categorías** (confiabilidad, seguridad, rendimiento, costo, operación) y se actualiza a diario.

## Fase complementaria 11: Usuarios externos B2B
- **B2B collaboration** invita a un externo como **Guest** (UPN con **#EXT#**) usando **sus propias credenciales**.
- **B2B direct connect** crea confianza bidireccional (Teams shared channels) y **no** crea Guest.
- **External tenant** es para apps de consumidores (CIAM); **email OTP** es el método por defecto para invitados.

## Fase complementaria 12: Resource locks y tags
- **CanNotDelete** permite leer/modificar pero no borrar; **ReadOnly** solo permite leer; el lock **anula permisos** (incluso Owner).
- Los locks se heredan (gana el más restrictivo), aplican **solo al control plane** y **no** se pueden poner en **management groups**.
- Tags: **50** pares por recurso, nombre **512** (128 Storage) y valor **256**; **no se heredan**, el nombre es insensible y el valor sensible.

## Fase complementaria 13: Bicep
- **Bicep** es un DSL declarativo que **compila a ARM JSON**; es **idempotente** y **no tiene estado**.
- Para convertir ARM→Bicep: **`az bicep decompile --file main.json`** (con **`--force`** para sobrescribir).
- `build` = Bicep→JSON; `decompile` = JSON→Bicep; los nombres simbólicos infieren dependencias.

## Fase complementaria 14: Encryption at host y mover VM
- **Encryption at host** cifra en el host (extremo a extremo, sin CPU) y **no convive con ADE**; una VM existente debe **desasignarse/reasignarse**.
- Mover a otro **RG/suscripción** (mismo tenant) **no cambia la región** y **cambia el resource ID**; los RG quedan bloqueados **hasta 4 h**.
- Solo se mueven **recursos de nivel superior**; un **read-only lock** bloquea el move.

## Fase complementaria 15: App Service networking y backup
- **VNet integration = salida**; **private endpoint = entrada**; **access restrictions** filtra entrada por IP/subred/service tag con **deny implícito**.
- Backup **automático**: 30 GB, cada hora, 30 días, sin configurar; **personalizado**: 10 GB, storage con **SAS**, programable y descargable.
- **Basic** solo permite backup del **slot de producción**; restaurar **detiene** el destino (restaura a slot y haz swap).

## Fase complementaria 16: ACR y Container Apps
- **ACR** tiene 3 SKU (Basic/Standard/Premium); solo **Premium** añade **geo-replicación**, **content trust** y **private endpoints**.
- **Container Apps** es serverless con **KEDA**: **scale to zero** (salvo CPU/memoria), **min 0 / max 10** por defecto (hasta 1000).
- Cada cambio de escala crea una **revisión inmutable**; con varias reglas escala cuando se cumple **la primera**.
