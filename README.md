# **Bank Management System**

---

## Descripción del Proyecto

El sistema tiene como objetivo gestionar las transacciones bancarias entre cuentas de clientes. Permite realizar operaciones como la creación, lectura, actualización y eliminación de clientes y cuentas bancarias. Además, se implementan operaciones de depósito y retiro en cuentas bancarias con validaciones de negocio.

---

## Requerimientos del Sistema
- **Spring Boot** para crear los microservicios.
- **MySQL** como base de datos relacional, utilizando **JPA/Hibernate** para la persistencia de datos.
- **OpenAPI** para la documentación de los contratos (enfoque **contract-first**).
- **Programación Funcional** y **POO** en Java 17.

---

## Arquitectura del Sistema

Este sistema está compuesto por dos microservicios principales:  
- **CustomerMs**: Gestiona todo lo relacionado con los clientes (crear, leer, actualizar, eliminar).
- **AccountMs**: Gestiona las cuentas bancarias (crear, leer, actualizar, eliminar, realizar transacciones).

---

### Diagrama de Secuencia
A continuación, se muestra el diagrama de secuencia que ilustra el flujo de comunicación entre los microservicios y las operaciones que realizan.

![Diagrama de Secuencia](https://github.com/user-attachments/assets/b1e10179-1806-4509-9450-13393c8444de)

---

### Diagrama de Componentes
Este diagrama ilustra la arquitectura de los microservicios y cómo se integran entre sí.

![Diagrama de Componentes](https://github.com/user-attachments/assets/cbac5ebc-7813-4c29-be91-0144b61fe9b8)

---

## Endpoints

http://localhost:8080
### Cliente
| Método  | Endpoint               | Descripción                         |
| ------- | ---------------------- | -----------------------------------  |
| POST    | /clientes               | Crear un nuevo cliente              |
| GET     | /clientes               | Listar todos los clientes           |
| GET     | /clientes/{id}          | Obtener detalles de un cliente      |
| PUT     | /clientes/{id}          | Actualizar los datos de un cliente  |
| DELETE  | /clientes/{id}          | Eliminar un cliente                 |

### Cuenta Bancaria
| Método  | Endpoint                       | Descripción                           |
| ------- | ------------------------------ | ------------------------------------- |
| POST    | /cuentas                       | Crear una cuenta bancaria            |
| GET     | /cuentas                       | Listar todas las cuentas bancarias   |
| GET     | /cuentas/{id}                  | Obtener detalles de una cuenta       |
| PUT     | /cuentas/{accountId}/depositar | Realizar un depósito en una cuenta   |
| PUT     | /cuentas/{accountId}/retirar   | Realizar un retiro de una cuenta     |
| DELETE  | /cuentas/{id}                  | Eliminar una cuenta bancaria         |

---

## Instalación y Ejecución

1. Clona el repositorio:
   ```bash
   git clone https://github.com/tu_usuario/banking-system.git

2. Configura la base de datos MySQL:
    - Asegúrate de tener MySQL instalado y corriendo.
    - Crea una base de datos llamada bank.
    - Importar la base de datos bank del repositorio.

3. Configura la conexión en el archivo application.properties:

    spring.application.name=banking-system
    spring.datasource.url=jdbc:mysql://localhost:3306/bank?useSSL=false&serverTimezone=UTC
    spring.datasource.username=root
    spring.datasource.password=your_password
    spring.jpa.hibernate.ddl-auto=update
    spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect
    spring.jpa.show-sql=true

5. Ejecuta el proyecto con Maven:
  ```bash
   mvn spring-boot:run
---

## **Autor**

- [Lisbeth Callata](https://github.com/lisbeth-callata)
