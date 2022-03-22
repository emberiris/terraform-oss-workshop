# Terraform Lab 01 - Microsoft Azure

## Prerequisitos

- Lab 01
 

## Terraform

### Escribir el código

Creamos a través del portal una Storage Account (con su RSG). Añadimos al bloque de tipo "terraform"  el sub-bloque de tipo "backend" y lanzamos el comando de apply. Mientras se lanza, podemos ver en la storage account como crea un "lock" para que nadie pueda realizar un cambio a la vez y como lo libera al final. Observamos el contenido de este tf-state desde la cuenta de almacenamiento.

- main.tf - Modificamos este archivo para que tenga el sub-bloque backend.
- variables.tf 
- outputs.tf

**Más información sobre este bloque especifico para Azure [aquí](https://www.terraform.io/language/settings/backends/azurerm)**


### Lanzamos los comandos Terraform y observamos las salidas de los diferentes pasos.

- *$ terraform fmt* 
- *$ terraform init*
- *$ terraform validate*
- *$ terraform plan*
- *$ terraform apply* 

> Recuerda: Debemos escribir "yes" en la fase de apply para despelgar nuestra infraestructura, pero... también podemos saltarnos la intervención manual si usamos el comando **"terraform apply -auto-approve"**
Una vez hemos recibido el 'Ok' de Terraform, podemos ver nuestro despliegue en la consola de Azure (Azure Portal). A continuación, para borrar todo los desplegado, usamos el comando siguiente:

- $ terraform destroy

> Otra vez: Debemos escribir "yes" en la fase de destroy para despelgar nuestra infraestructura, pero... también podemos saltarnos la intervención manual si usamos el comando  **"terraform destroy -auto-approve"**