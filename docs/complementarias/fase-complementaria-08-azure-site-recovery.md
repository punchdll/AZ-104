# Fase complementaria 8: Azure Site Recovery y failover a región secundaria

> Fase complementaria (tema no cubierto por las lecciones). Fuente: documentación oficial de Microsoft Learn (About Site Recovery, Quickstart Azure-to-Azure).

## Si solo recuerdas 3 cosas
- **Azure Site Recovery (ASR)** da **replicación continua, failover y recuperación** para continuidad de negocio (BCDR), cubriendo fallos **zonales** y **regionales**, y cumpliendo **RPO y RTO**.
- Replica **VMs de Azure entre regiones**, **Extended Zones → región**, y **on-premises** (VMware, Hyper-V, servidores físicos) y **AWS Windows → Azure**.
- El failover usa **recovery points** con **snapshots con coherencia de aplicación**; tras recuperar, se puede **failback** a la región primaria.

## Objetivo de repaso
Recordar qué protege Site Recovery, sus capacidades (RPO/RTO, recovery plans, prueba de failover) y el flujo Azure-to-Azure.

## Comparaciones clave

| Escenario | Origen → destino |
|---|---|
| Azure-to-Azure | Región de Azure → otra región |
| Extended Zones | Azure Extended Zone → región conectada |
| On-premises | VMware/Hyper-V/físicos → Azure |
| Otros | AWS Windows → Azure |

| Concepto | Detalle |
|---|---|
| RPO / RTO | Objetivos de pérdida y tiempo de recuperación; ASR los respeta |
| Replicación | Continua para VMs de Azure/VMware; **Hyper-V hasta cada 30 s** |
| Recovery plan | Secuencia el failover de apps multitier (scripts/acciones manuales, runbooks) |
| Test failover | Prueba de DR **sin interrumpir** la replicación |
| Failover planificado | Cortes esperados, **cero pérdida de datos** |
| Failover no planificado | Desastres; pérdida mínima según frecuencia |
| Failback | Volver a la primaria cuando esté disponible |

## Diagrama
```mermaid
flowchart LR
    subgraph Primaria
      VM1[VM de Azure]
    end
    VM1 -->|replicacion continua| CACHE[Storage de la region destino]
    CACHE --> subgraph Secundaria
      VM2[VM recuperada]
    end
    VM2 -->|failover / test failover| DR[App en la region secundaria]
    DR -->|failback| VM1
    TM[Azure Traffic Manager] -. reduce RTO .- DR
```

## Requisitos y restricciones
- Requiere planificar **dependencias de la app, conectividad de red, capacidad del entorno destino y failover**.
- Se instala una **extensión de Site Recovery (Mobility service)** en la VM durante la replicación; al **deshabilitar** la replicación, la extensión **no se elimina** automáticamente.
- **High Churn** soporta hasta **100 MB/s** (hasta 500 MB/s en configuraciones específicas).
- Azure-to-Azure **no** admite vaults creados en **South Central India** ni **North East US 5** (esas regiones pueden ser origen/destino con un vault en región soportada).
- Con **Premium SSD v2 o Ultra Disk**, si el origen no tiene zonas y el destino sí, hay que elegir una **zona** para el failover.
- La replicación no intercepta los datos de la aplicación; los datos van a **Azure Storage** con su resiliencia.

## Requisito → Consecuencia
| Si… | Entonces… | Si no… |
|---|---|---|
| Quieres DR entre regiones de Azure | Configura **replicación Azure-to-Azure** | No tendrías recuperación regional |
| Necesitas recuperar apps multitier en orden | Usa un **recovery plan** | El failover sería descoordinado |
| Quieres probar la DR sin afectar producción | Ejecuta un **test failover** | Pondrías en riesgo la replicación |
| Necesitas salir de la región secundaria | Haz **failback** a la primaria | Quedarías en la secundaria |

## Casos de uso típicos
- Continuidad de negocio ante caída de una región de Azure.
- Migración con replicación y conmutación controlada.
- Protección de apps multitier con secuencia (recovery plans).
- Pruebas de resiliencia regional (test failover / drills).

## Puntos críticos para el examen
- ASR = **replicación + failover + recuperación** (BCDR), con **RPO/RTO**.
- Replica **Azure→Azure**, **Extended Zones→región** y **on-prem→Azure**.
- En VMs de Azure **no termina** la replicación en snapshots sin más: mantiene replicación **continua**.
- **Test failover** no interrumpe la replicación.
- **Failover planificado** = cero pérdida; **no planificado** = pérdida mínima.
- **Recovery plans** secuencian apps multitier (runbooks/Automation).
- Al deshabilitar replicación **no** se quita la extensión automáticamente.

## Trampa típica del examen
- Confundir **Azure Backup** (protección de datos) con **Site Recovery** (continuidad/DR).
- Creer que el test failover interrumpe la replicación (no).
- Pensar que el failover planificado puede perder datos (es **cero pérdida**).
- Olvidar que hay que **eliminar la extensión** de SR manualmente al deshabilitar la replicación.
- Creer que ASR no soporta on-premises (sí: VMware, Hyper-V, físicos).

## Mini-escenario resuelto
**Escenario:** Una app crítica en Azure debe seguir disponible si su región cae por completo, con conmutación ordenada de sus tres capas.
**Respuesta:** Configurar **Azure Site Recovery (Azure-to-Azure)** con un **recovery plan** que secuencie el failover.
**Por qué:** ASR replica continuamente a una región secundaria y el recovery plan orquesta el failover de la app multitier.

## Productos relacionados
Productos nuevos → `docs/referencia/glosario-productos.md`: **Azure Site Recovery** (ya registrado; se amplía).
Comparativa → `docs/referencia/comparativa-productos.md`: grupo **Backup y DR (Azure Backup vs Site Recovery)**.
Términos nuevos → `docs/referencia/glosario.md`: **RPO**, **RTO**, **recovery plan**, **failover / failback**, **test failover**, **Mobility service**.

## Errores comunes / troubleshooting
- La replicación no se habilita → región origen/destino no soportada o falta capacidad en el destino.
- No puedo elegir zona en el failover → origen sin zonas y destino con zonas (hay que fijar una zona).
- Coste residual tras deshabilitar → la extensión de SR sigue en la VM hasta eliminarla.
