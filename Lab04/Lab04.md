# Terraform Lab 04 - Microsoft Azure

## Prerequisitos

- Terraform Lab 02-03

### Escribir el código

Modificamos el código y la estructura para convertir nuestra VM en un módulo de VM. Este módulo pedirá los datos de la VM junto con los datos necesarios para crear un disco de datos asociado a la máquina. Posteriormente consumimos este módulo desde el archivo vm.tf para ver si lo hemos hecho bien y se crea nuestra VM con su disco de datos.

Podemos usar bloques "data" en el interior del módulo. Estos son un tipo de bloque especial del que podemos extraer información de algo ya desplegado. Otro caso de uso muy utilizado es aprovechar estos bloques "data" para sacar más información del recurso sin que el consumidor del módulo  (o del archivo .tf) tenga que darnos más datos. Por ejemplo, si un usuario nos da el nombre del RSG, nosotros podemos sacar el ID completo del RSG así:

    ```hcl
data "azurerm_resource_group" "example" {
  name = "existing"
}

output "id" {
  value = data.azurerm_resource_group.example.id
}
    ```
En la documentación del provider de terraform podemos ver todos los bloques "data", lo que necesitan para funcionar y lo que podemos obtener de ellos si miramos la parte "Data Sources" del recurso que estamos mirando. Como veis, el nombre "azurerm_resource_group" es igual, tanto para "resource" como para "data".

- main.tf
- variables.tf - Editamos para mover las variables de la vm al archivo de variables del módulo.
- outputs.tf - Editamos para mover los outputs de la vm al archivo de outputs del módulo.
- vm.tf - Editamos para mover los bloques de resource de la vnet al main.tf del módulo y posteriormente usamos este archivo para llamar al módulo y que cree una vm. Podemos eliminar las expresiones de control del Lab03 para facilitar el trabajo.
- network.tf - Podemos eliminar las expresiones de control del Lab03 (usar el network.tf del Lab02) para facilitar el trabajo. Nos llevamos la creación de la public_ip al modulo y hacemos que la creación de la misma dependa de una variable que ponga el consumidor del módulo.
- vm-module/ - carpeta que contendrá un archivo main.tf, un variables.tf y un outputs.tf y en el interior de estos archivos, todo el código relativo a la creación de la VM y su disco de datos. 

 **Recuerda tenera mano siempre la documentación del registry de Terraform que vayas a desplegar**

### Lanzamos los comandos Terraform y observamos las salidas de los diferentes pasos.

- *$ terraform fmt* 
- *$ terraform init*
- *$ terraform validate*
- *$ terraform plan*
- *$ terraform apply* 

Una vez hemos recibido el 'Ok' de Terraform, podemos ver nuestro despliegue en la consola de Azure (Azure Portal) y comprobar que se ha desplegado. Para finalizar, podemos borrar todo lo desplegado, usamos:

- $ terraform destroy

> Otra vez: Debemos escribir "yes" en la fase de destroy para despelgar nuestra infraestructura, pero... también podemos saltarnos la intervención manual si usamos el comando  **"terraform destroy -auto-approve"**