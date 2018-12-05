# Cartelera i - API

[![Maintainability](https://api.codeclimate.com/v1/badges/7c40c2f93e040573d76c/maintainability)](https://codeclimate.com/github/ProyectoIntegrador2018/cartelera_backend/maintainability)

Este es el repositorio de "Cartelera de Innovación - API" para el Tec de Monterrey,
un proyecto que listará eventos próximos a suceder dentro del Tec. Esta parte del 
proyecto actuará como API para las distintas partes del front-end.

## Tabla de Contenidos

- [Cartelera i - API](#cartelera-i---api)
  - [Tabla de Contenidos](#tabla-de-contenidos)
    - [Detalles del Cliente](#detalles-del-cliente)
    - [URLs de Ambiente](#urls-de-ambiente)
    - [Equipo](#equipo)
    - [Recursos de Mantenimiento](#recursos-de-mantenimiento)
  - [Desarrollo](#desarrollo)
    - [Setup del Proyecto](#setup-del-proyecto)
    - [Correr el Proyecto para Desarrollo](#correr-el-proyecto-para-desarrollo)
    - [Detener el Proyecto](#detener-el-proyecto)
    - [Debugging](#debugging)
    - [Correr Pruebas](#correr-pruebas)
  - [Contribuciones](#contribuciones)


### Detalles del Cliente

| Nombre                       | Email                    | Rol                 |
| ---------------------------- | ------------------------ | ------------------- |
| Julio Noriega                | jnoriega@itesm.mx        | Cliente             |
| A Diaz de Leon               | adiazdeleon@itesm.mx     | Asociado al Cliente |
| Azael Jesus Cortes Capetillo | azael.capetillo@itesm.mx | Asociado al Cliente |


### URLs de Ambiente

* **Producción** - [API en Heroku](https://cartelerai-api.herokuapp.com/)
* **Desarrollo** - Maquina Local

### Equipo

| Nombre                           | Email                   | Rol                        |
| -------------------------------- | ----------------------- | -------------------------- |
| Alvaro Ramírez Rosselló          | A00814982@itesm.mx      | Backend Developer          |
| Diego Adolfo José Villa          | A00815260@itesm.mx      | Frontend Developer         |
| Julio Mauricio Noriega Reséndiz  | A01273613@itesm.mx      | Frontend Developer         |
| Luis Carlos Flores Gallardo      | A01196081@itesm.mx      | Backend Developer/DevOps   |
| Luis Uriel Ávila Vargas          | A00815578@itesm.mx      | Frontend Developer         |

### Recursos de Mantenimiento

Se debe preguntar por las credenciales necesarias en caso de no tenerlas:

* [Github repo](https://github.com/ProyectoIntegrador2018/cartelera_backend)
* [Backlog](https://github.com/ProyectoIntegrador2018/cartelera_backend/projects)
* [Heroku](https://cartelerai-api.herokuapp.com/)
* [Documentación] **Revisar archivos proporcionados por el profesor**

## Desarrollo

### Setup del Proyecto

Para poder correr la API, se necesita [Ruby](http://www.ruby-lang.org/en/) y [Ruby on Rails](https://rubyonrails.org/).
Instalar Rails esta fuera del alcance de este proyecto, pero se recomienda usar [RailsBridge Installfest](http://installfest.railsbridge.org/installfest/).

Despues de instalar todo lo anterior, sigue estos pasos para hacer el setup del proyecto:

1. Clona este repositorio en la computadora en donde se va a desarrollar:

```bash
$ git clone https://github.com/ProyectoIntegrador2018/cartelera_backend.git
```

2. Instala todas las gemas y dependencias del proyecto:

```bash
$ bundle install
```
o
```bash
$ bundle
```

3. Crea la base de datos:

```bash
$ rake db:setup
```

### Correr el Proyecto para Desarrollo

1. Abre la terminal y corre el siguiente comando:

```bash
$ rails server
```

Este comando iniciara el servidor localmente en tu localhost en el puerto 3000.

Si se despliega la siguiente información:

```
web_1   | => Booting Puma
web_1   | => Rails 5.1.3 application starting in development on http://0.0.0.0:3000
web_1   | => Run `rails server -h` for more startup options
web_1   | => Ctrl-C to shutdown server
web_1   | Listening on 0.0.0.0:3000, CTRL+C to stop
```

Significa que el proyecto esta corriendo.

### Detener el Proyecto

Para detener el servidor simplemente oprime estas teclas:

```
% CTRL+C
```

### Debugging

Usamos 'byebug' para debugear el proyecto. Si estas familiarizado con esta gema
no es necesario nada mas.
Tambien hacemos uso de 'rails-pry' si no se esta familiarizado con 'byebug'.

### Correr Pruebas

Para correr pruebas se usa el siguiente comando:

```
$ rspec
```

O para un archivo en especifico:

```
$ rspec spec/models/user_spec.rb
```

## Contribuciones

Porfavor contribuye con [Github Flow](https://guides.github.com/introduction/flow/). Crea una branch, agrega commits, y [abre un pull request](https://github.com/ProyectoIntegrador2018/cartelera_backend/pulls).
