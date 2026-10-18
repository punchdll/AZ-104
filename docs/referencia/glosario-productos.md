# Glosario de productos Azure

| Producto | Qué es (1 línea) | Categoría | Fase donde aparece |
|---|---|---|---|
| Azure Cloud Shell | Entorno de línea de comandos basado en navegador, gestionado por Microsoft, con Azure CLI y PowerShell actualizados. | Administración | 1 |
| CloudDrive | Almacenamiento persistente de Cloud Shell, respaldado por un recurso compartido de Azure Files, ligado a una sola región. | Administración | 1 |
| Azure Files | Servicio de recursos compartidos de archivos en la nube (SMB/NFS/REST). | Almacenamiento | 1, 20 |
| Azure Resource Manager (ARM) | Plano de administración de Azure; motor de despliegue de plantillas ARM. | Administración | 2 |
| Microsoft Entra ID | Directorio de identidad en la nube (PaaS) multiinquilino para autenticación y autorización. | Identidad | 3 |
| Microsoft Entra Domain Services | Dominio gestionado en la nube (domain join, GPO, Kerberos) sin administrar controladores. | Identidad | 3 |
| Microsoft Entra Connect / Cloud Sync | Sincronización de identidades entre AD on-premises y Entra ID. | Identidad | 3, 4 |
| Microsoft Entra ID P1 / P2 | Planes de pago de Entra ID; P2 añade ID Protection y PIM. | Identidad | 4 |
| Microsoft Intune | Gestión de dispositivos y aplicaciones (MDM/MAM) integrada con Entra. | Identidad | 4 |
| Grupos de Microsoft 365 | Grupos de colaboración (buzón, calendario, SharePoint) que admiten invitados. | Identidad | 4 |
| Regiones de Azure | Áreas geográficas con uno o más datacenters donde se despliegan recursos. | Fundamentos | 5 |
| Zonas de disponibilidad | Ubicaciones físicas separadas dentro de una región (mínimo 3) para alta disponibilidad. | Fundamentos | 5 |
| Pares de región | Regiones emparejadas a ≥300 millas dentro de la misma geografía. | Fundamentos | 5 |
| Grupos de administración | Contenedores sobre las suscripciones para gobernanza y herencia de políticas/RBAC. | Fundamentos | 5 |
| Azure Policy | Servicio de gobernanza que evalúa recursos contra reglas y aplica efectos. | Gobernanza | 6 |
| Microsoft Cloud Adoption Framework (CAF) | Marco de Microsoft para la adopción de la nube (metodología y buenas prácticas). | Gobernanza | 6 |
| Azure RBAC | Control de acceso por roles sobre recursos de Azure (principal + role + scope). | Identidad | 7 |
| Microsoft Entra SSPR | Autoservicio de restablecimiento de contraseña para los usuarios. | Identidad | 8 |
| Azure Virtual Network | Red definida por software con bloques CIDR, subredes y direccionamiento. | Red | 9 |
| Azure NAT Gateway | Servicio de traducción de direcciones de salida para subredes. | Red | 9 |
| Network Security Group (NSG) | Recurso que filtra tráfico con reglas allow/deny por prioridad. | Seguridad de red | 10 |
| Application Security Group (ASG) | Agrupación lógica de VMs por carga de trabajo para reglas NSG. | Seguridad de red | 10 |
| Azure DNS | Servicio de hospedaje de zonas DNS públicas y privadas. | DNS | 11 |
| Azure Private DNS zones | Zonas DNS privadas resueltas dentro de VNets vinculadas. | DNS | 11, 12 |
| Azure Traffic Manager | Balanceador global basado en DNS que distribuye tráfico entre regiones. | Balanceo | 11 |
| Azure Front Door | Puerta de enlace global de capa 7 con balanceo, aceleración, WAF y caché. | Balanceo | 11 |
| Azure CDN | Red de entrega de contenido para distribuir contenido en el borde. | Red | 11 |
| Azure Virtual Network Manager | Gestión central de topologías (hub-and-spoke, mesh) a escala. | Red | 12 |
| Azure Route Table (UDR) | Tabla de rutas definidas por el usuario asociada a subredes. | Red | 13 |
| Network Virtual Appliance (NVA) | VM que controla el flujo de tráfico (firewall, router, IDS/IPS…). | Seguridad de red | 13 |
| Azure VPN Gateway | Puerta de enlace para conectar VNets a on-premises/otras VNets. | Red | 13 |
| Azure Load Balancer | Balanceador de capa 4 (TCP/UDP), regional y redundante de zona. | Balanceo | 14 |
| Azure Application Gateway | ADC de capa 7 (HTTP/HTTPS) regional con WAF, TLS y afinidad de sesión. | Balanceo | 15 |
| Web Application Firewall (WAF) | Filtro que protege apps web contra SQL injection, XSS y otras amenazas. | Seguridad de red | 15 |
| Azure Network Watcher | Conjunto de herramientas para monitorizar y diagnosticar recursos IaaS. | Monitoreo | 16 |
| Connection Monitor | Herramienta de Network Watcher para monitorización continua extremo a extremo. | Monitoreo | 16 |
| Azure Storage | Plataforma de almacenamiento (Blob, Files, Queue, Table, discos, Data Lake). | Almacenamiento | 17 |
| Azure Blob Storage | Almacenamiento de objetos no estructurados (cuenta→contenedor→blob). | Almacenamiento | 17, 18 |
| Azure Queue Storage | Almacenamiento de mensajes para desacoplar componentes. | Almacenamiento | 17 |
| Azure Table Storage | Almacén NoSQL de datos estructurados sin esquema (clave/atributo). | Almacenamiento | 17 |
| Azure Data Lake Storage | Almacenamiento optimizado para analítica de big data (HNS). | Almacenamiento | 17 |
| Azure Managed Disks | Discos administrados para VMs de Azure (SO y datos). | Almacenamiento | 17 |
| Azure Storage Explorer | Aplicación GUI multiplataforma para administrar el almacenamiento. | Almacenamiento | 17, 20 |
| AzCopy | Herramienta de línea de comandos para copiar datos a/desde Azure Storage. | Almacenamiento | 18 |
| Azure Data Box Disk | Dispositivo físico (SSD) para migrar grandes volúmenes de datos a Azure. | Almacenamiento | 18 |
| Azure Key Vault | Servicio para almacenar y gestionar claves, secretos y certificados. | Seguridad | 19 |
| Azure Key Vault Managed HSM | Módulo de seguridad de hardware gestionado (FIPS 140-2 Nivel 3) para claves. | Seguridad | 19 |
| Microsoft Defender for Storage | Detección proactiva de amenazas en cuentas de almacenamiento. | Seguridad | 19 |
| Storage Insights | Monitorización del rendimiento y disponibilidad del almacenamiento (Azure Monitor). | Monitoreo | 19, comp. 6 |
| Azure File Sync | Servicio que convierte un Windows Server en caché de Azure Files. | Almacenamiento | 20 |
| Storage Sync Service | Recurso de nivel superior para configurar Azure File Sync. | Almacenamiento | 20 |
| Azure Virtual Machines | Servicio de máquinas virtuales IaaS (Windows/Linux). | Cómputo | 21 |
| Azure Compute Gallery | Catálogo para compartir imágenes y versiones de VM. | Cómputo | 21 |
| Azure Hybrid Benefit | Beneficio que reduce el coste de licencia de Windows/Linux. | Cómputo | 21 |
| Azure Automation | Automatización de tareas y configuración (runbooks). | Administración | 21 |
| Azure Virtual Machine Scale Sets | Conjunto de VMs idénticas que escala horizontalmente con autoscale. | Cómputo | 22 |
| Availability Sets | Agrupación de VMs para repartirlas entre dominios de error/actualización. | Cómputo | 22 |
| Availability Zones | Ubicaciones separadas dentro de una región para tolerar el fallo de un datacenter. | Cómputo | 22 |
| Azure Site Recovery | Servicio de recuperación ante desastres con replicación y failover a otra región. | Backup/DR | 22, comp. 8 |
| Azure App Service | Plataforma PaaS para hospedar apps web, backends móviles y API. | Cómputo | 23, 24 |
| Azure App Service plan | Cómputo (SO, región, tier, instancias) donde corren una o varias apps. | Cómputo | 23 |
| Azure App Service Environment | Plan de App Service aislado en una VNet (tier Isolated). | Cómputo | 23 |
| Application Insights | Monitorización de rendimiento y diagnóstico de aplicaciones (Azure Monitor). | Monitoreo | 24, 28 |
| Azure Pipelines / Azure DevOps | Servicios de CI/CD usados para desplegar en App Service. | DevOps | 24 |
| Azure Container Instances (ACI) | Ejecución rápida y simple de contenedores sin gestionar VMs. | Contenedores | 25 |
| Azure Container Apps (ACA) | Plataforma serverless para microservicios y jobs basada en Kubernetes. | Contenedores | 25, comp. 16 |
| Azure Kubernetes Service (AKS) | Kubernetes administrado con control total del clúster. | Contenedores | 25 |
| Azure Container Registry (ACR) | Registro privado de imágenes de contenedor. | Contenedores | 25, comp. 16 |
| Azure Backup | Servicio sin infraestructura para copias de seguridad de recursos de Azure. | Backup/DR | 26, 27, comp. 9 |
| Recovery Services vault | Almacén que organiza las copias de VMs, SQL/SAP, Azure Files y blobs. | Backup/DR | 26, comp. 9 |
| Backup vault | Almacén para discos, blobs, PostgreSQL y otros tipos más recientes. | Backup/DR | 26, comp. 7 |
| Azure Monitor | Plataforma de supervisión con métricas y logs (recursos Azure y no Azure). | Monitoreo | 28, comp. 4-6 |
| Log Analytics | Servicio de almacenamiento y consulta de logs (KQL). | Monitoreo | 28, comp. 4, comp. 9 |
| VM Insights | Característica de Azure Monitor para VM con rendimiento y Map (dependencias). | Monitoreo | 28 |
| Azure Monitor Agent (AMA) | Agente que recopila datos de logs del sistema operativo. | Monitoreo | 28 |
| Azure Bastion | Servicio PaaS administrado para RDP/SSH sobre TLS sin IP pública en las VMs. | Seguridad de red | comp. 1 |
| Azure Private Link | Acceso privado a servicios PaaS y propios mediante private endpoints. | Acceso a PaaS | comp. 2 |
| Service Endpoint | Extiende la identidad de la VNet a un servicio PaaS por el backbone de Azure. | Acceso a PaaS | comp. 2 |
| Private Endpoint | NIC con IP privada en tu VNet que conecta a un private-link resource. | Acceso a PaaS | comp. 2 |
| Azure Data Explorer | Plataforma de análisis de datos y base del lenguaje KQL de Azure Monitor. | Monitoreo | comp. 4 |
| Action Groups | Conjunto de notificaciones y acciones automatizadas para alertas de Azure Monitor. | Monitoreo | comp. 5 |
| Alert Processing Rules | Reglas que añaden/suprimen grupos de acción o aplican filtros/horarios a alertas disparadas. | Monitoreo | comp. 5 |
| Azure Logic Apps | Servicio de flujos de trabajo usado como acción de alertas y para transformar esquemas. | Integración | comp. 5 |
| Azure Functions | Servicio serverless usado como acción de alerta (HTTP trigger). | Integración | comp. 5 |
| Azure Event Hubs | Servicio de ingesta de eventos; acción de alerta que soporta Private Link/NSP. | Integración | comp. 5 |
| Azure Monitor Insights | Familia de insights (VM, Storage, Network) de Azure Monitor, sin configuración. | Monitoreo | comp. 6 |
| Network Insights | Vista de topología, salud, conectividad y diagnóstico de red (Azure Monitor). | Monitoreo | comp. 6 |
| Microsoft Cost Management | Suite FinOps para analizar, monitorear y optimizar costos. | Gobierno | comp. 10 |
| Azure Advisor | Recomendaciones de mejores prácticas en 5 categorías. | Gobierno | comp. 10 |
| Azure Pricing Calculator | Estimador de precios gratuito y sin autenticación. | Gobierno | comp. 10 |
| Azure Reservations | Compromiso de uso con descuento (hasta 72 %). | Gobierno | comp. 10 |
| Azure Savings Plan | Compromiso de gasto en compute con descuento (hasta 65 %). | Gobierno | comp. 10 |
| Microsoft Entra External ID | Solución para identidades externas (B2B y CIAM). | Identidad | comp. 11 |
| B2B collaboration | Invita externos como guests con sus propias credenciales. | Identidad | comp. 11 |
| B2B direct connect | Confianza bidireccional sin crear objetos guest. | Identidad | comp. 11 |
| Entitlement Management | Gestión de acceso de externos a escala (paquetes, revisiones). | Identidad | comp. 11 |
| Microsoft Entra ID B2C | Solución legada de CIAM; sin venta a nuevos clientes desde may-2025. | Identidad | comp. 11 |
| Bicep | DSL declarativo que compila a ARM JSON. | IaC | comp. 13 |
| Bicep CLI | Herramienta para build y decompile de Bicep. | IaC | comp. 13 |
| Azure Disk Encryption (ADE) | Cifrado BitLocker/dm-crypt dentro del guest. | Seguridad | comp. 14 |
| Azure Resource Mover | Herramienta para mover recursos entre regiones. | Gobierno | comp. 14 |
| App Service Environment (ASE) | App Service single-tenant desplegado en una VNet. | Cómputo | comp. 15 |
| Hybrid Connections | Acceso saliente a recursos on-prem sin VNet. | Cómputo | comp. 15 |
