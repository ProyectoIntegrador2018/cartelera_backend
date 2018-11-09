# Cartelera i - API

This is the repository of "Cartelera de Innovación - API" for Tec de Monterrey,
a project that will list upcoming events that happens in the TEC circle. This
part of the project acts as an API for the front end parts.

## Table of contents

* [Client Details](#client-details)
* [Environment URLS](#environment-urls)
* [Team](#team)
* [Management resources](#management-resources)
* [Setup the project](#setup-the-project)
* [Running the stack for development](#running-the-stack-for-development)
* [Stop the project](#stop-the-project)
* [Debugging](#debugging)
* [Running specs](#running-specs)
* [Contributing](#contributing)


### Client Details

| Name               | Email                 | Role |
| ------------------ | --------------------- | ---- |
| Julio Noriega      | jnoriega@itesm.mx     |      |
| A Diaz de Leon     | adiazdeleon@itesm.mx  |      |


### Environment URLS

* **Production** - [API in Heroku](https://cartelerai-api.herokuapp.com/)
* **Development** - Local machine

### Team

| Name                             | Email                   | Role                       |
| -------------------------------- | ----------------------- | -------------------------- |
| Alvaro Ramírez Rosselló          | alvaro.rsl@outlook.com  | Backend/Frontend Developer |
| Diego Adolfo José Villa          |                         | Frontend Developer         |
| Julio Mauricio Noriega Reséndiz  |                         | Frontend Developer         |
| Luis Carlos Flores Gallardo      | luiscfgmay294@gmail.com | Backend Developer/DevOps   |
| Luis Uriel Ávila Vargas          |                         | Frontend Developer         |

### Management tools

You should ask for access to this tools if you don't have it already:

* [Github repo](https://github.com/ProyectoIntegrador2018/cartelera_backend)
<!-- * [Backlog]() -->
* [Heroku](https://cartelera-api.herokuapp.com/)
<!-- * [Documentation]() -->

## Development

### Setup the project

In order to run this API, you will need [Ruby](https://www.ruby-lang.org/en/) and [Ruby on Rails](https://rubyonrails.org/),
installing rails is out of the scope of this project, but we highly recommend [RailsBridge Installfest](http://installfest.railsbridge.org/installfest/).

After installing follow these simple steps to make the setup:

1. Clone this repository into your local machine

```bash
$ git clone https://github.com/ProyectoIntegrador2018/cartelera_backend.git
```

2. Install all the gems and dependencies:

```bash
$ bundle install
```

3. Setup the database

```bash
$ rake db:setup
```

### Running the stack for Development

1. Fire up a terminal and run:

```bash
$ rails server
```

This command will start the server locally in your localhost in port 3000.

Once you see an output like this:

```
web_1   | => Booting Puma
web_1   | => Rails 5.1.3 application starting in development on http://0.0.0.0:3000
web_1   | => Run `rails server -h` for more startup options
web_1   | => Ctrl-C to shutdown server
web_1   | Listening on 0.0.0.0:3000, CTRL+C to stop
```

It means the project is up and running.

### Stop the project

In order to stop the running server just press the following command:

```
% CTRL+C
```

### Debugging

We use `byebug` to debug the project, so if you are already comfortable you are
all setup.

### Running specs

To run specs:

```
$ rspec
```

Or for a specific file:

```
$ rspec spec/models/user_spec.rb
```

## Contributing

Please contribute using [Github Flow](https://guides.github.com/introduction/flow/). Create a branch, add commits, and [open a pull request](https://github.com/ProyectoIntegrador2018/cartelera_backend).
