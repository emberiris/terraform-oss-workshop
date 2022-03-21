# Terraform Lab 02 - Microsoft Azure

## Prerequisitos

- Terraform Lab 01

### Escribir el código

Escribimos el código para desplegar una VM Linux (y todo lo que necesite la VM para ser desplegada). Trabajamos los archivos de Lab 01.

- main.tf - Este archivo contendrá la definición de los recursos y proveedores.
- variables.tf - Este archivo contendrá la definición de todas las variables.
- outputs.tf - Este archivo contendrá la definición de las salidas que se mostraran en la consola.
 
 Pero ahora empezamos a añadir archivos nuevos, como se recomienda en proyetos reales, separando por archivo los diferentes tipos de recurso:

- vm.tf - Este archivo contendrá la definición de todo bloque de recursos de tipo "Azurerm_virtual_machine" y derivados (como la NIC si no la queremos meter en el "network.tf" por tener más relación con la vm).
- network.tf - Este archivo contendrá la definiciónd de todo bloque de recursos que despliegue componentes de red. Podemos mover aquí la creación de la VNet y Subnete dsde el main.tf, para añadir después un NSG y su asociación a una subnet, una Public IP, etc...

 **Ten a mano siempre la documentación del recurso que vayas a desplegar, para VM Linux echa un ojo [aquí](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine)**

### Lanzamos los comandos Terraform y observamos las salidas de los diferentes pasos.

- *$ terraform fmt* (opcional, podemos probar el comando de formateo de código de Terraform)
- *$ terraform init*
- *$ terraform validate*
- *$ terraform plan*
- *$ terraform apply* 

Una vez hemos recibido el 'Ok' de Terraform, podemos ver nuestro despliegue en la consola de Azure (Azure Portal) y probar conexión SSH con la máquina desplegado. Para finalizar, podemos borrar todo lo desplegado, usamos:

- $ terraform destroy

> Otra vez: Debemos escribir "yes" en la fase de destroy para despelgar nuestra infraestructura, pero... también podemos saltarnos la intervención manual si usamos el comando  **"terraform destroy -auto-approve"**