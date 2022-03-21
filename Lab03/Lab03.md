# Terraform Lab 03 - Microsoft Azure

## Prerequisitos

- Terraform Lab 02

### Escribir el código

Escribimos código con diferentes expresiones de control para desplegar 2 VM Linux con 2 discos (y todo lo que necesite la VM para ser desplegada), desplegando cada una en una subred diferente, estas subredes también las creamos usando expresiones de control. Trabajamos desde los archivos de Lab 02.

- main.tf
- variables.tf
- outputs.tf - Necesitara cambios para mostrarnos todas las outputs que tendrá ahora. (Funciones For o Splat)
- vm.tf - Editamos para crear una segunda máquina iterando. (Diferentes nombres, subnets, bloque dynamic sobre storage_os_disk, etc...)
- network.tf - Editamos para crear otra subnet directamente desde el bloquVnet Iterando.

 **Recuerda tenera mano siempre la documentación del registry de Terraform que vayas a desplegar**

### Lanzamos los comandos Terraform y observamos las salidas de los diferentes pasos.

- *$ terraform fmt* (opcional, podemos probar el comando de formateo de código de Terraform)
- *$ terraform init*
- *$ terraform validate*
- *$ terraform plan*
- *$ terraform apply* 

Una vez hemos recibido el 'Ok' de Terraform, podemos ver nuestro despliegue en la consola de Azure (Azure Portal) y comprobar que se ha desplegado en las diferentes subnets con los diferentes valores otorgados. Para finalizar, podemos borrar todo lo desplegado, usamos:

- $ terraform destroy

> Otra vez: Debemos escribir "yes" en la fase de destroy para despelgar nuestra infraestructura, pero... también podemos saltarnos la intervención manual si usamos el comando  **"terraform destroy -auto-approve"**