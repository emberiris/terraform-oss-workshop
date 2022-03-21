# Terraform Lab 01 - Microsoft Azure

## Prerequisitos

- IDE Sencillo (VS Code, Atom, etc) 
- Microsoft Azure Subscription. 
- Hashicorp Terraform instalado (y preferiblemente añadido al PATH)
- (Opcional) Un SPN con acceso de tipo **Contributor** 
 

## Terraform

### Escribir el código

Escribimos el código para desplegar una Subnet (y todo lo que necesite la subnet para ser desplegada). Recordar la división inicial que hemos hecho de los documentos.

- main.tf - Este archivo contendrá la definición de los recursos y proveedores.
- variables.tf - Este archivo contendrá la definición de todas las variables.
- outputs.tf - Este archivo contendrá la definición de las salidas que se mostraran en la consola.

Recuerda: Estos nombres son "básicos" y para proyectos pequeños. En proyectos grandes, podemos dividir los recursos en varios archivos .tf (podemos llamar al variables.tf como aquinohayvariables.tf, que a Terraform le da igual).

### Autenticamos Terraform contra Azure

> Podemos añadir estas variables de SPN al archivo **terraform.tfvars** en el formato adjunto.
*client_id  = "CLIENTID-OF-THE-APP"\
client_secret  = "CLIENT-SECRET-OF-THE-APP"\
subscription_id  = "SUBSCRIPTIONID"\
tenant_id  = "TENANTID"*

**Esto es todo lo contrario a una buena practica, pero sirve para aprender. Si elegimos esta forma, NUNCA SUBIRLO AL CONTROL DE VERSIONES, DEBERÁ SIEMPRE SER ARCHIVO LOCAL DE TU PC. 
La forma correcta, si trabajamos sin herramientas que puedan manejar estos secretos, es guardarlos como "variables de entorno". Más información sobre el proceo de autenticación Terraform-Azure [aquí](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/service_principal_client_secret)**


> Por otro lado, podemos otorgarle a Terraform estas credenciales en "tiempo de ejecución", utilizando los siguientes comando y variables: 
- *$ terraform plan -var "client_id=CLIENT_ID" -var "client_secret=CLIENT_SECRET" -var "subscription_id=SUBSCRIPTION_ID" -var "tenant_id=TENANT_ID"

> Por último, podemos autenticarnos con Azure CLI y Terraform automáticamente utilizará esta sesión para generar el despliegue.
- *az login
- *az account set --subscription="SUBSCRIPTION_ID"
- *terraform plan / terraform apply  (Recuerda: necesitas tener el bloque "provider" y "terraform" en tu código para que funcione.)

**Más información sobre este método [aquí](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/azure_cli)**

### Lanzamos los comandos Terraform y observamos las salidas de los diferentes pasos.

- *$ terraform fmt* (opcional, podemos probar el comando de formateo de código de Terraform)
- *$ terraform init*
- *$ terraform validate*
- *$ terraform plan*
- *$ terraform apply* 

> Recuerda: Debemos escribir "yes" en la fase de apply para despelgar nuestra infraestructura, pero... también podemos saltarnos la intervención manual si usamos el comando **"terraform apply -auto-approve"**
Una vez hemos recibido el 'Ok' de Terraform, podemos ver nuestro despliegue en la consola de Azure (Azure Portal). A continuación, para borrar todo los desplegado, usamos el comando siguiente:

- $ terraform destroy

> Otra vez: Debemos escribir "yes" en la fase de destroy para despelgar nuestra infraestructura, pero... también podemos saltarnos la intervención manual si usamos el comando  **"terraform destroy -auto-approve"**