# Glosario de términos técnicos

Solo términos técnicos específicos de Azure (los productos van en `glosario-productos.md`).

| Término | Definición breve | Fase donde aparece |
|---|---|---|
| Doble cifrado en reposo | Cifrado en dos capas aplicado por defecto a los datos almacenados (p. ej. CloudDrive). | 1 |
| Plantilla ARM | Archivo JSON declarativo que define infraestructura y configuración de un despliegue. | 2 |
| Despliegue idempotente | Re-desplegar la misma plantilla no recrea ni duplica recursos si no cambia. | 2 |
| Parámetro seguro (secureString/secureObject) | Parámetro cuyo valor no puede leerse tras el despliegue (para secretos). | 2 |
| SCIM | Estándar para aprovisionar/desaprovisionar usuarios y grupos automáticamente. | 4 |
| Custom security attributes | Atributos de negocio personalizados (Boolean/int/string) para clasificar objetos. | 4 |
| Usage location | Ubicación del usuario; necesaria para asignar licencias y determinar servicios. | 4 |
| Cloud Kerberos Trust | Mecanismo híbrido que sustituye al device writeback para autenticación Kerberos en la nube. | 4 |
| Definición de directiva | Regla de Azure Policy con `if` (condición) y `then` (efecto). | 6 |
| Iniciativa (policy set) | Grupo de definiciones de directiva que se asignan como una sola unidad. | 6 |
| Asignación (policy) | Aplica una definición o iniciativa a un ámbito y define el enforcement. | 6 |
| Exención (exemption) | Exceptúa recursos del cumplimiento; categorías Mitigated o Waiver. | 6 |
| Atestación (attestation) | Fija manualmente el estado de cumplimiento de políticas con efecto Manual. | 6 |
| Remediación | Tarea que pone en conformidad los recursos no conformes existentes. | 6 |
| Efecto (policy) | Acción que aplica una directiva (Deny, Audit, Append, Modify, DeployIfNotExists…). | 6 |
| enforcementMode | Default (aplica el efecto) o DoNotEnforce (evalúa sin aplicar; «what-if»). | 6 |
| Alias (policy) | Nombre que expone una propiedad del recurso para usarla en la condición. | 6 |
| Asignación de rol | Une security principal + role definition + scope. | 7 |
| Scope (RBAC) | Ámbito donde se aplica un rol (grupo de administración/suscripción/RG/recurso). | 7 |
| NotActions | Permisos restados de las Actions; definen lo que un rol no puede hacer. | 7 |
| Modelo allow | En Azure RBAC los permisos se suman; no hay denegación explícita. | 7 |
| Writeback (de contraseñas) | Escribir en AD on-premises la contraseña cambiada en la nube (requiere P1/P2). | 8 |
| Método de autenticación | Mecanismo de verificación para SSPR/MFA (app, email, teléfono, preguntas). | 8 |
| CIDR | Notación de rango de direcciones IP (p. ej. 10.0.0.0/24). | 9 |
| Subred | División lógica de una VNet con su propio rango CIDR. | 9 |
| IP reservada | Las 5 direcciones que Azure reserva en cada subred. | 9 |
| Service tag | Grupo gestionado de rangos IP de un servicio de Azure, usable en reglas. | 10 |
| Regla predeterminada (NSG) | Regla allow/deny que Azure crea y que no se puede eliminar. | 10 |
| Effective security rules | Reglas NSG realmente aplicadas a una NIC (subred + NIC combinadas). | 10 |
| Alias record (DNS) | Registro A/AAAA/CNAME que apunta a un recurso de Azure y sigue su ciclo de vida. | 11 |
| Split-horizon DNS | Resolver un mismo nombre de forma distinta en el ámbito público y el privado. | 11 |
| VNet peering | Conexión de dos VNets que operan como una sola red por el backbone de Azure. | 12 |
| No transitivo | Propiedad del peering: A↔B y B↔C no implican conectividad A↔C. | 12 |
| Gateway transit | Permitir que VNets peered usen el gateway de la VNet remota. | 12 |
| Service chaining | UDR que dirige el tráfico a un appliance o gateway en otra VNet. | 12 |
| Ruta del sistema | Ruta automática de Azure; no se crea ni se elimina. | 13 |
| UDR (ruta definida por el usuario) | Ruta personalizada que anula el enrutamiento del sistema. | 13 |
| IP forwarding | Habilitar en la NIC de un NVA para que reenvíe tráfico ajeno. | 13 |
| Prefijo más largo (longest prefix match) | Regla de selección de ruta por mayor coincidencia de prefijo. | 13 |
| Backend pool | Conjunto de destinos (VMs/instancias) que reciben tráfico balanceado. | 14 |
| Health probe | Sondeo que verifica la salud de los destinos del backend. | 14 |
| Regla de balanceo | Regla que define cómo se reparte el tráfico hacia el backend. | 14 |
| Afinidad de sesión | Enviar las peticiones de una sesión al mismo servidor backend. | 15 |
| Terminación TLS | Descifrar el tráfico TLS en el gateway y reenviarlo a los backends. | 15 |
| IP flow verify | Herramienta que indica si un paquete se permite/deniega y qué regla lo hace. | 16 |
| NSG diagnostics | Diagnóstico de reglas NSG ampliado (VMSS, App Gateway, service tags). | 16 |
| Flow logs | Registro del tráfico IP (NSG/VNet) almacenado para análisis. | 16 |
| Traffic analytics | Visualizaciones enriquecidas generadas a partir de flow logs. | 16 |
| Packet capture | Captura remota de paquetes de una VM/VMSS. | 16 |
| LRS / ZRS / GRS / RA-GRS / GZRS / RA-GZRS | Estrategias de replicación de almacenamiento (local, zona, región, lectura secundaria, geo-zona). | 17 |
| Storage endpoint | Punto de acceso del servicio (`<cuenta>.<servicio>.core.windows.net`). | 17 |
| SSE (Storage Service Encryption) | Cifrado AES-256 en reposo, automático y no desactivable. | 17, 19 |
| HNS (hierarchical namespace) | Espacio de nombres jerárquico que habilita SFTP/Data Lake en Blob. | 17 |
| Rehidratación | Sacar un blob del nivel Archive (Copy Blob o Set Blob Tier) para poder leerlo. | 18 |
| Blob versioning | Mantener versiones anteriores de cada blob (requerido por object replication). | 18 |
| Object replication | Replicación asíncrona de blobs entre cuentas (requiere versioning). | 18 |
| Blob lifecycle rules | Reglas If/Then para transicionar de nivel o eliminar blobs/versiones. | 18 |
| SAS (Shared Access Signature) | URI con permisos y vigencia especificados para acceso delegado. | 19 |
| Stored access policy | Política del lado servidor que permite controlar/revocar SAS sin rotar claves. | 19 |
| Shared Key | Autenticación con la clave de la cuenta (control total). | 19 |
| CMK (customer-managed keys) | Claves gestionadas por el cliente en Key Vault/Managed HSM. | 19 |
| PMK (platform-managed keys) | Claves generadas y gestionadas por Azure (predeterminado). | 19 |
| BYOK | Escenario CMK en el que el cliente importa su propia clave. | 19 |
| Infrastructure encryption | Doble cifrado de los datos en reposo (dos claves/algoritmos). | 19 |
| Clock skew (SAS) | Desfase de reloj; por eso el inicio de una SAS se fija ≥15 min en el pasado. | 19 |
| Cloud tiering | Mover datos «fríos» del servidor a Azure Files dejando un puntero local. | 20 |
| Server endpoint | Ruta NTFS de un Windows Server registrado en un sync group. | 20 |
| Cloud endpoint | Recurso compartido de Azure Files incluido en un sync group. | 20 |
| Soft delete | Retención de recursos borrados (1–365 días) para poder recuperarlos. | 20 |
| Share snapshot | Copia incremental de solo lectura de un recurso compartido (máx. 200). | 20 |
| Availability set | Agrupación que reparte VMs entre dominios de error y de actualización. | 21, 22 |
| VM extension | Pequeña aplicación que aporta configuración/monitorización a la VM. | 21 |
| Live Migration | Migración en caliente de una VM dentro del clúster ante mantenimiento. | 21, 22 |
| Fault domain | Grupo de hardware que comparte un punto único de fallo (mismo rack). | 22 |
| Update domain | Grupo de VMs que se reinician juntas en mantenimiento planeado. | 22 |
| Scale up / scale out | Escalado vertical (tamaño) y horizontal (número de instancias). | 22 |
| Autoscale | Reglas (métrica o tiempo) que ajustan el número de instancias. | 22 |
| Orquestación Uniform / Flexible (VMSS) | Modos de scale set: imágenes idénticas vs imágenes/tamaños distintos. | 22 |
| Deployment slot | App activa con su propio hostname para validar y hacer swap sin downtime. | 24 |
| Swap (slots) | Intercambio de contenido y configuración entre un slot y producción. | 24 |
| CI/CD | Integración y entrega/despliegue continuos (p. ej. GitHub Actions). | 24 |
| Always On | Ajuste que evita que la app se descargue; requerido por WebJobs continuos. | 24 |
| EasyAuthModule | Módulo de autenticación integrado de App Service (visible en los traces). | 24 |
| Container group | Grupo de contenedores co-programados que comparten host, ciclo de vida y red. | 25 |
| Container image | Paquete autocontenido con código, runtime, librerías y settings. | 25 |
| Port mapping | Asignación de puertos host→contenedor; **ACI no la soporta**. | 25 |
| Scale to zero | Reducir a cero instancias cuando no hay carga (Azure Container Apps). | 25 |
| KEDA | Escalado basado en eventos usado por Azure Container Apps. | 25 |
| Backup policy | Directiva que define frecuencia y retención de las copias. | 26 |
| Retención de corto/largo plazo | Snapshot (recuperación rápida) y copia en el vault (retención prolongada). | 26 |
| Snapshot (backup) | Copia puntual en el almacenamiento del recurso o en el vault. | 26, 27 |
| Application consistency | Coherencia de aplicaciones en el backup (VSS en Windows / scripts en Linux). | 27 |
| File Recovery | Restauración de archivos individuales montando el punto de recuperación. | 27 |
| Punto de recuperación | Momento concreto del que se puede restaurar un recurso. | 27 |
| Métrica de host / invitado | Métrica de la plataforma (sin agente) vs del sistema operativo (con agente). | 28 |
| DCR (regla de recopilación de datos) | Define qué datos recopilar y a dónde enviarlos (Azure Monitor). | 28 |
| Log Analytics workspace | Almacén de logs consultable con KQL. | 28 |
| KQL | Lenguaje de consulta usado en Azure Monitor/Log Analytics. | 28 |
| AzureBastionSubnet | Subred dedicada (/26 o mayor) requerida por Azure Bastion. | comp. 1 |
| Host scaling | Ajustar el número de instancias (scale units) de Azure Bastion (Standard+). | comp. 1 |
| Shareable link | Enlace que permite conectarse a una VM por Bastion sin acceder al portal (Standard+). | comp. 1 |
| Session recording | Grabación de sesiones RDP/SSH de Bastion (requiere SKU Premium). | comp. 1 |
| Private-link resource | Recurso destino (Azure o propio) al que se conecta un private endpoint. | comp. 2 |
| Target subresource | Subrecurso del servicio al que apunta un private endpoint (p. ej. blob, sqlServer). | comp. 2 |
| Connection approval | Flujo automático o manual para aprobar una conexión de private endpoint. | comp. 2 |
| Virtual network rule | Regla que restringe un servicio PaaS a una subred/VNet (usada por service endpoints). | comp. 2 |
| Data Path Availability | Métrica del LB que refleja la salud de la ruta de datos en la región. | comp. 3 |
| Health Probe Status | Métrica del LB que refleja la salud de cada instancia según el sondeo. | comp. 3 |
| SNAT | Traducción de direcciones de origen para flujos de salida; su agotamiento causa fallos. | comp. 3 |
| Resource health | Estado de disponibilidad de un recurso de Azure (Available/Degraded/Unavailable/Unknown). | comp. 3 |
| Regla de alerta de búsqueda de logs | Regla de Azure Monitor basada en una consulta KQL evaluada a una frecuencia. | comp. 4 |
| API de consulta (Log Analytics) | Endpoint REST que ejecuta consultas KQL; requiere TLS 1.2+. | comp. 4 |
| Regla de alerta | Define recursos + señal + condición; genera alertas. | comp. 5 |
| Grupo de acción | Colección de notificaciones y acciones automatizadas que se disparan con una alerta. | comp. 5 |
| Alerta stateful / stateless | Stateful no repite hasta resolverse; stateless dispara en cada evaluación. | comp. 5 |
| Regla de procesamiento | Modifica alertas disparadas (añade/suprime grupos, filtros, horarios); no genera alertas. | comp. 5 |
| Common alert schema | Esquema de payload unificado para las alertas de Azure Monitor. | comp. 5 |
| Workbook (Azure Monitor) | Reporte visual interactivo basado en consultas y métricas. | comp. 6 |
| Identidad administrada (system/user-assigned) | Identidad de Azure usada por el Backup vault para su RBAC. | comp. 7 |
| Cross Region Restore | Restaurar desde la región secundaria sin que haya una caída declarada (PostgreSQL). | comp. 7 |
| RPO | Recovery Point Objective: pérdida máxima de datos aceptable. | comp. 8 |
| RTO | Recovery Time Objective: tiempo máximo aceptable de recuperación. | comp. 8 |
| Recovery plan | Agrupa y secuencia el failover de apps multitier (scripts/runbooks). | comp. 8 |
| Failover / failback | Conmutar a la región secundaria y regresar a la primaria. | comp. 8 |
| Test failover | Prueba de DR de Site Recovery que no interrumpe la replicación. | comp. 8 |
| Mobility service | Extensión de Site Recovery instalada en la VM durante la replicación. | comp. 8 |
| Diagnostics settings | Configuración que envía los datos de diagnóstico de un vault a Log Analytics. | comp. 9 |
| Backup Reports | Reportes consolidados de Azure Backup basados en Log Analytics + workbooks. | comp. 9 |
| Budget | Límite de gasto con alertas por umbral real o previsto; no bloquea recursos. | comp. 10 |
| Anomaly alert | Aviso por cambio inesperado del uso diario; solo suscripciones. | comp. 10 |
| Scheduled alert | Envío programado de una vista guardada de Cost Analysis. | comp. 10 |
| Tag inheritance | Copia tags de suscripción/RG al dato de costo, sin guardarlos en el recurso. | comp. 10 |
| Cost allocation | Reparte costos compartidos entre ámbitos; no cambia la factura. | comp. 10 |
| Savings plan | Compromiso de gasto que reduce el precio de compute (hasta 65 %). | comp. 10 |
| Reservation | Compromiso de uso por 1 o 3 años con descuento (hasta 72 %). | comp. 10 |
| Guest user | Usuario externo invitado a tu directorio; UPN con `#EXT#`. | comp. 11 |
| Redemption | Canje de la invitación B2B por el usuario externo. | comp. 11 |
| Cross-tenant access | Configuración de colaboración entrante/saliente con otras organizaciones Entra. | comp. 11 |
| External collaboration settings | Controla quién puede invitar externos y qué dominios se permiten. | comp. 11 |
| Self-service sign-up | Flujo para que el invitado se registre solo. | comp. 11 |
| CIAM | Gestión de identidades y acceso para clientes/consumidores. | comp. 11 |
| CanNotDelete | Lock que impide borrar pero permite leer y modificar. | comp. 12 |
| ReadOnly | Lock que solo permite leer; bloquea modificaciones y borrados. | comp. 12 |
| Control plane / data plane | Los locks aplican al control plane, no al data plane. | comp. 12 |
| cm-resource-parent | Tag que agrupa costos por recurso padre en Cost Management. | comp. 12 |
| DSL | Lenguaje específico de dominio, como Bicep para infraestructura. | comp. 13 |
| Idempotencia | Desplegar el mismo archivo produce el mismo estado sin cambios extra. | comp. 13 |
| Nombre simbólico | Identificador de recurso en Bicep que infiere dependencias. | comp. 13 |
| Módulo Bicep | Archivo Bicep reutilizable que despliega un conjunto de recursos. | comp. 13 |
| targetScope | Ámbito de despliegue de un archivo Bicep (RG, suscripción, MG, tenant). | comp. 13 |
| what-if | Previsualización de cambios antes de desplegar. | comp. 13 |
| decompile | Conversión de una plantilla ARM JSON a Bicep. | comp. 13 |
| Encryption at host | Cifrado en el host de la VM, extremo a extremo y sin usar CPU. | comp. 14 |
| SSE | Server-side encryption de discos administrados (predeterminado). | comp. 14 |
| DEK / KEK | Data Encryption Key y Key Encryption Key del cifrado de discos. | comp. 14 |
| Double encryption | Capa adicional de cifrado en infraestructura para discos. | comp. 14 |
| Resource ID | Identificador único del recurso; cambia al moverlo de RG/suscripción. | comp. 14 |
| Move operation | Mueve recursos entre RG/suscripciones; no cambia la región. | comp. 14 |
| VNet integration | Salida de App Service hacia una VNet; no da entrada privada. | comp. 15 |
| Access restrictions | Lista allow/deny de entrada por IP, subred o service tag. | comp. 15 |
| Delegated subnet | Subred dedicada que usa App Service para VNet integration. | comp. 15 |
| MPSJ | Multi Plan Subnet Join: varios planes App Service en una subred (/26). | comp. 15 |
| All traffic routing | Envía todo el tráfico saliente de la app por la VNet. | comp. 15 |
| Custom backup (App Service) | Backup configurable, programable y descargable a un storage con SAS. | comp. 15 |
| Linked database | Base de datos incluida en el backup personalizado de App Service. | comp. 15 |
| Revisión (Container Apps) | Snapshot inmutable de una container app; cada cambio de escala crea una. | comp. 16 |
| KEDA | Autoscaler basado en eventos usado por Container Apps. | comp. 16 |
| Traffic splitting | Reparto de tráfico entre revisiones para blue/green o A/B. | comp. 16 |
| Content trust | Firma de tags de imagen en ACR Premium. | comp. 16 |
| ACR Tasks | Builds de imágenes en Azure, on-demand o automatizados. | comp. 16 |
