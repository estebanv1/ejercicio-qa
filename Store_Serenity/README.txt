# ejercicio-qa Serenity
Ejercicio de pruebas para aplicativo web

### Riesgos

Los riesgos de producto identificados se encuentran en la ruta `"ejercicio-qa\Store_Serenity\Documentos de pruebas"` en el archivo RiesgosProducto.

### Escenarios de prueba

Se definen un escenario con 12 casos de prueba con los siguientes pasos:

- Given that Esteban wants to make a purchase on the demoblaze site: Este paso abre la página de inicio del sitio web.
- When he adds the <firstItem> from the <firstSection> section to the cart: En este paso se visita la sección ingresada (firstSection) y en ella se seleccioan el artículo ingresado (firstItem), para finalmente volver a la página de inicio.
- And he adds the <secondItem> from the <secondSection> section to the cart: Análogo al anterior.
- And he sees the products in the shopping cart: En este paso se visita el carrito de compras y se verifica la existencia en él de los dos productos agregados en los pasos anteriores.
- And he completes the purchase form: En este paso se realiza la orden en el carrito de compras, se diligencia la información del cliente y finalmente se completa la compra.
- Then he sees the confirmation message: Se verifica la información presentada por la página confirmando que la compra fue exitosa.

### Ejecución de pruebas

Es posible ejecutar las pruebas utilizando un IDE como Intellij con los plugins Gradle, Cucumber for Java y Gherkin, además de Java 21, ejecutando la clase `src\test\java\store\runners\MakePurchaseRunner.java`, o bien, desde el cmd ubicado en la raíz del proyecto con el comando `gradlew clean :test --tests "store.runners.MakePurchaseRunner" --info"`.

### Reportes

El reporte se encuentran almacenado en las ruta `"ejercicio-qa\Store_Serenity\Documentos de pruebas\index.html"` como acceso directo.

### Conclusiones

Se genera el archivo de conclusiones en la ruta `"ejercicio-qa\Store_Serenity\Documentos de pruebas"`.




