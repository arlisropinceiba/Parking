# Parking

Consiste en un sistema que simula el comportamiento del vigilante de un parqueadero, las reglas de negocio son las siguientes:
* El parqueadero recibe carros y motos 
* El parqueadero solo puede tener 20 carros y 10 motos simultáneamente
* Las placas que inician por la letra "A" solo pueden ingresar al parqueadero los días Domingo y Lunes, de lo contrario debe mostrar un mensaje de que no esta autorizado a ingresar.
* La tabla de precios es la siguiente: Valor hora carro = 1000 Valor hora moto = 500 valor día carro = 8000 valor día moto = 4000
* Las motos que tengan un cilindraje mayor a 500 CC paga 2000 de mas al valor total.
* Cuando sale un carro del parqueadero se cobra por horas si permaneció menos de 9 horas en el parqueadero, de lo contrario se cobra por días.
* El valor del día comienza entre las 9 horas de parqueo y finaliza pasadas 24 horas de parqueo.
* El parqueadero funciona 24 horas, los 7 días de la semana.
EJEMPLOS:  *Si el carro permaneció un día y 3 horas se debe cobrar 11.000 *Si la moto permaneció un 10 horas y es de 650CC se cobra 6.000


* La aplicación debe no debe detenerse ni mostrar errores cuando se gira la pantalla
* La aplicación debe conservar la experiencia de usuario al rotar la pantalla
* La aplicación no debe detenerse cuando regresa de segundo plano
* La aplicación no debe permitir ingresar emojis en los campos de texto
* Se debe validar en los campos de texto el tamaño máximo de caracteres
* No se debe utilizar el hilo principal para consumos de servicios y tareas asíncronas
