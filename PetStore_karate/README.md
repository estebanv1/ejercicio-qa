# ejercicio-qa karate
Ejercicio de pruebas para API

### Riesgos

Los riesgos de producto identificados se encuentran en la ruta `"ejercicio-qa\PetStore_karate\Documentos de pruebas"` en el archivo RiesgosProducto.

### Postman

Se adjunta una colección de postman para pruebas manuales y familiarización con el servicio en la ruta `"ejercicio-qa\PetStore_karate\Documentos de pruebas"`.

### Escenarios de prueba

Se definen los siguientes 3 escenarios de prueba:

- Pet creation and search by id: Este escenario envía una primera petición creando una mascota, y una posterior consultando por el id de la mascota creada y evaluando cada campo enviado. Se evalúan 10 casos.
- Failed pet creation: Este escenario verifica el control de los errores al momento de recibir peticiones de creación de mascotas con tamaños, formatos o estructura incorrectos, y de la recepción de mensajes de error adecuados.
- Pet name and status update: Validación de que las peticiones de actualización de nombre y estado de las mascotas a 'sold' se procese correctamente (Por ejemplo al vender una mascota).
- Pet search by status: Validación de las mascotas actualizadas en el escenario anterior, aparezcan ahora en la consulta filtrando por estado 'sold'.
- Search for pets by incorrect status: Validación de las mascotas actualizadas en el escenario anterior, no aparezcan en la consulta filtrando por estados diferentes 'sold'.

### Ejecución de pruebas

Es posible ejecutar las pruebas utilizando un IDE como Intellij con los plugins Gradle, Cucumber for Java y Karate, ejecutando la clase `src.petstore.pets.PetsRunner.java`, o bien, desde el cmd ubicado en la raíz del proyecto con el comando `gradlew clean test --tests "petstore.pets.PetsRunner"`.
El otro runner presente en el proyecto es para ejecutar múltiples features y generar el reporte en cucumber.

### Reportes

Los reportes se encuentran almacenados en las rutas `"C:\Users\esteb\IdeaProjects\ejercicio-qa\PetStore_karate\Documentos de pruebas\karate-reports\karate-report.html"` y `"C:\Users\esteb\Desktop\Nueva carpeta\cucumber-html-reports\Cucumber-report.html"`.

### Conclusiones

Se genera el archivo de conclusiones en la ruta `"ejercicio-qa\PetStore_karate\Documentos de pruebas"`.


