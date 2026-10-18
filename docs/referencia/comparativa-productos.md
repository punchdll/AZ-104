# Comparativa de productos similares

Los datos comparativos se centralizan aquí; en cada fase solo se enlaza a la tabla del grupo correspondiente.

## Grupo: Directorio / Identidad
| Producto | Tipo | Estructura | Consulta/Protocolo | Cuándo usarlo |
|---|---|---|---|---|
| Active Directory Domain Services (AD DS) | Directorio en Windows Server (IaaS) | Jerárquica (OUs, GPO) | LDAP, Kerberos, NTLM | Control de dominio local completo |
| Microsoft Entra ID | Directorio en la nube (PaaS) | Plana (sin OUs ni GPO) | REST sobre HTTP/HTTPS (SAML, OIDC) | Autenticación de apps en la nube/SaaS |
| Microsoft Entra Domain Services | Dominio gestionado en la nube | OUs planas, GPO integrada | LDAP, Kerberos, NTLM | Apps heredadas que necesitan domain join sin administrar DC |

## Grupo: Seguridad de red
| Producto | Qué controla | Alcance | Cuándo usarlo | Limitación clave |
|---|---|---|---|---|
| Network Security Group (NSG) | Reglas allow/deny de tráfico IP | Subred y/o NIC (1 por cada) | Filtrado básico por prioridad | Máximo 1 NSG por subred/NIC |
| Application Security Group (ASG) | Agrupación de VMs | Origen/destino dentro de reglas NSG | Reglas por carga de trabajo sin IPs | No filtra por sí mismo; se usa en NSG |
| Azure Bastion | Acceso de administración RDP/SSH sobre TLS | VMs de la VNet (+ VNets peered) | Acceso administrativo seguro sin IP pública en las VMs | Requiere `AzureBastionSubnet` /26+ e IP pública Standard (salvo private-only); session recording solo Premium |

> Nota: **Azure Firewall** aparece mencionado en las lecciones (fases 9–10) pero **no se explica**; se registra en `docs/referencia/temas-no-cubiertos.md`.

## Grupo: DNS
| Producto | Visibilidad | Resolución | Cuándo usarlo |
|---|---|---|---|
| Azure DNS (zona pública) | Internet | Nombres públicos del dominio | Hospedar el dominio (requiere registrador externo) |
| Azure Private DNS zones | Privada (VNet vinculadas) | Nombres de VMs dentro de VNets | Resolución interna y split-horizon |

## Grupo: Balanceadores / distribución de tráfico
| Producto | Capa | Alcance | Cuándo usarlo | Limitación clave |
|---|---|---|---|---|
| Azure Load Balancer | L4 (TCP/UDP) | Regional | Ultra baja latencia, alto rendimiento | Sin WAF ni ruteo HTTP |
| Azure Application Gateway | L7 (HTTP/HTTPS) | Regional | WAF, terminación TLS, afinidad de sesión | No es global |
| Azure Traffic Manager | DNS | Global | Distribuir por dominio entre regiones | Solo resolución DNS |
| Azure Front Door | L7 | Global | Balanceo global + aceleración, WAF, caché | Servicio global (no regional) |

## Grupo: Acceso a PaaS (red)
| Producto | Cómo funciona | Exposición | DNS | Cuándo usarlo |
|---|---|---|---|---|
| Service endpoint | Extiende la identidad de la VNet al servicio por el backbone | El servicio conserva su endpoint público (restringido) | Resuelve a la IP pública del servicio | Restringir acceso sencillo desde subredes; sin coste; no cubre on-prem |
| Private endpoint (Private Link) | NIC con IP privada en tu VNet conectada al servicio | El servicio no se expone a internet | Requiere private DNS zone → IP privada | Aislamiento total, on-prem y producción |
| Private Link service | Publicas tu propio servicio tras un Standard LB con alias | Consumo privado por otros | Según el consumidor | Exponer tu servicio a clientes de forma privada |

## Grupo: Almacenamiento de archivos
| Producto | Protocolo | Espacio de nombres | Ideal para |
|---|---|---|---|
| Azure Files | SMB, NFS, REST | Jerárquico (recursos compartidos) | Lift and shift, compartir datos/herramientas |
| Azure Blob Storage | REST (+SFTP/NFSv3 con HNS) | Plano (contenedores) | Streaming, acceso aleatorio, datos a gran escala |

## Grupo: Alta disponibilidad de VM
| Producto | Protege contra | Nivel | Cuándo usarlo |
|---|---|---|---|
| Availability set | Fallo de hardware/rack | Rack (dominios de error/actualización) | VMs idénticas dentro de un datacenter |
| Availability zone | Fallo de un datacenter | Zona (mínimo 3) | Alta disponibilidad frente a caída de datacenter |
| VM Scale Sets + autoscale | Variación de carga | Instancias | Escalado horizontal automático |

## Grupo: Servicios de contenedores
| Producto | Escenario | Control | Escalado | Cuándo usarlo |
|---|---|---|---|---|
| Azure Container Instances (ACI) | Tareas aisladas y cortas | Mínimo (sin Kubernetes) | Manual | Ejecución rápida y simple |
| Azure Container Apps (ACA) | Microservicios serverless, jobs | PaaS (sin APIs de Kubernetes) | KEDA, HTTP/eventos/CPU; scale to zero | Escalado automático sin gestionar clúster |
| Azure Kubernetes Service (AKS) | Aplicaciones complejas de larga duración | Control total de Kubernetes | HPA/KEDA/nodos | Orquestación completa |
| Azure Container Registry (ACR) | Registro de imágenes y artefactos | Basic/Standard/Premium | N/A | Almacenar y distribuir imágenes privadas |

## Grupo: Backup y recuperación ante desastres (DR)
| Producto | Qué guarda | Alcance | Cuándo usarlo |
|---|---|---|---|
| Recovery Services vault | VMs, SQL/SAP en VM, Azure Files, blobs | Copias con retención de corto y largo plazo | Backup de workloads clásicos |
| Backup vault | Azure Disks, blobs, PostgreSQL, etc. | Tipos más recientes | Nuevos escenarios de protección |
| Azure Backup | Servicio de copia (usa vaults) | VMs, discos, archivos, bases de datos | Protección de datos y cumplimiento |
| Azure Site Recovery | Replicación y failover a región secundaria | Recuperación ante desastres (DR) | Continuidad de negocio entre regiones |

## Grupo: Monitoreo
| Producto | Qué hace | Ámbito |
|---|---|---|
| Azure Monitor | Plataforma de métricas y logs | Recursos de Azure y no Azure |
| Log Analytics | Almacén y consultas (KQL) de logs | Logs recolectados de recursos |
| Application Insights | APM de aplicaciones (rendimiento, errores, dependencias) | Apps y servicios |
| VM Insights | Rendimiento de VM + Map de dependencias | Máquinas virtuales |
| Storage insights | Rendimiento, capacidad y disponibilidad del almacenamiento | Cuentas de Storage |
| Network insights | Topología, salud, conectividad, tráfico y diagnóstico | Red |
| Action Groups | Notificaciones y acciones automatizadas de alertas | Alertas |
| Alert Processing Rules | Modifican alertas disparadas (añadir/suprimir grupos, filtros, horario) | Alertas |
| Network Watcher | Diagnóstico y monitorización de red IaaS | Red (VNets, NSGs, VMs) |
| Connection Monitor | Monitorización continua de conectividad extremo a extremo | Red (Azure e híbrido) |

## Grupo: Gobierno y costos
| Producto | Qué hace | Alcance | Cuándo usarlo | Limitación clave |
|---|---|---|---|---|
| Microsoft Cost Management | Analiza, monitorea y optimiza costos | Suscripción/RG/MG/billing | Análisis y presupuestos | Datos 8–24 h; no incluye créditos/impuestos |
| Budgets | Alerta por gasto real/previsto | MG/suscripción/RG/EA/MCA | Control proactivo | No bloquea recursos; action groups solo suscripción/RG |
| Azure Advisor | Recomendaciones en 5 categorías | Suscripción/RG | Optimización | Se actualiza a diario; read-only lock lo rompe |
| Azure Pricing Calculator | Estima precios | Público | Antes de desplegar | No usa consumo real |
| Resource locks | Protege de borrado/cambios | Suscripción/RG/recurso | Proteger producción | Solo control plane; no MG |
| Tags | Metadatos clave-valor | Recurso/RG/suscripción | Facturación y organización | No se heredan; 50 pares |

## Grupo: Identidad externa
| Producto | Escenario | ¿Crea guest? | Credenciales | Cuándo usarlo |
|---|---|---|---|---|
| B2B collaboration | Socios acceden a apps | Sí | Su IdP | Invitados en tu tenant de trabajo |
| B2B direct connect | Teams shared channels | No | Su organización | Confianza bidireccional sin guests |
| External tenant (CIAM) | Apps para consumidores | N/A | Email/OTP/social | App pública de clientes |
| Entitlement Management | Acceso de externos a escala | Sí | N/A | Paquetes, aprobaciones y revisiones |

## Grupo: Infraestructura como código
| Herramienta | Lenguaje | Estado | Compila a | Cuándo usarlo |
|---|---|---|---|---|
| ARM templates | JSON | Sin estado | N/A | Plantillas nativas de Azure |
| Bicep | DSL | Sin estado | ARM JSON | Autoría concisa en Azure |
| Terraform | HCL | Con estado | Plan/API | Multi-nube y ecosistema amplio |

## Grupo: Cifrado de discos
| Opción | Dónde cifra | Disco temporal | Usa CPU | Cuándo usarlo |
|---|---|---|---|---|
| SSE | Storage | No | No | Predeterminado de discos administrados |
| Encryption at host | Host de la VM | Sí | No | Cifrado extremo a extremo sin impacto |
| Azure Disk Encryption (ADE) | Guest (BitLocker/dm-crypt) | No aplica | Sí | Requisitos de cifrado en el guest |
| Double encryption | Infraestructura | — | No | Capa adicional de cifrado |

## Grupo: App Service networking
| Feature | Dirección | Qué hace | Cuándo usarlo | Limitación |
|---|---|---|---|---|
| VNet integration | Salida | Acceso a VNet, peered o ExpressRoute | Llamar a recursos privados | No da entrada; requiere Basic+ |
| Private endpoint | Entrada | IP privada para la app | Exponer la app solo en la VNet | Requiere DNS privado |
| Access restrictions | Entrada | Allow/deny por IP, subred o service tag | Restringir el origen | Deny implícito; 512 reglas |
| Hybrid Connections | Salida | Acceso a on-prem sin VNet | Red no conectada a Azure | Requiere relay |
| ASE | Ambas | Aislamiento single-tenant | Cumplimiento estricto | SKU Isolated y mayor coste |
