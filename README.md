Instrucciones.
--------------

 1.- Se debe instalar los siguientes paquetes en Node:
     npm i -D nodemon
     npm i express
     npm i express-handlebars
     npm i express-fileupload
     npm i cookie-parser
     npm i jsonwebtoken
     npm i dotenv
     npm i pg
     npm i body-parser

 2.- Ingresar a postgress con SQL Shell (psql) con su cuenta:
      - Revisar que exista la Base de datos sino revisar archivo data.sql si esta correcta las instrucciones debes ir al terminal y ejecutar la siguiente instrucción: node run db:migrar.

 3.- En el archivo vistas.route.js existen las rutas para las API.-

 4.- En el archivo back.route.js existen las rutas para el Front.

 5.- En el archivo creapropietarios.handlebard esta la pantalla donde permite crear nuevos propietarios.

 6.- En el archivo creavisitas.handlebard esta la pantalla donde nos permite crear nuevas visitas.

 7.- En el archivo home.handlebard esta la pantalla donde el usuario ingresa al sistema o se registra si no existe.

 8.- En el archivo main.handlebard esta la pantalla principal con su respectivo body.

 9.- En el archivo index.js tenemos el programa principal donde incorporamos los paquetes necesarios para la ejecución del proyecto.

10.- La ejecución la hacemos con el paquete nodemon de la siguiente manera:
     nodemon index.js.-

11.- Tablero Trello.
     https://trello.com/b/RDmuSjUZ/control-de-acceso-peatonal-y-vehicular.

12.- UML : https://app.diagrams.net/diagrama1.drawio

13.- Figma : Pantalla.InicioSesion.fig
             Pantalla.Menu.fig
             Pantalla.Propietarios.fig
             Pantalla.Visitas.fig

14.- HibGub : 
https://github.com/FranciscoAtal/Control-de-Acceso-Peatonal-y-Vehicular
