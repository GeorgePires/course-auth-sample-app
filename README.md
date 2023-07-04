
# Auth Sample App

Applicación base para el taller de [Autorización para Redes Sociales en Rails](https://codigofacilito.com/talleres/rails-autorizacion) en Código Facilito.

En este taller aprenderemos a hacer el feature de cuentas privadas que vemos en Redes Sociales que usamos a diario.
Para ello aprenderemos sobre autorización con Pundit y aplicaremos métodos avanzados de Active Record para poder integrar asociaciones múltiples entre modelos.
Iremos desde la idea hasta la ejecución de un feature complejo.


## Tech Stack

**Client:** TailwindCSS

**Server:** Rails 7, Ruby 3.1, PostgreSQL 14.1, Yarn 1.22


## Correr el proyect en local

Clona el proyecto

```bash
  git clone git@github.com:GeorgePires/course-auth-sample-app.git
```

Navega al directorio del proyecto

```bash
  cd course-auth-sample-app
```

Instala las dependencias

```bash
  bundle install
  yarn install
```

Preparar la base de datos:

```bash
  rails db:create
  rails db:migrate
  rails db:seed
```

Iniciar el servidor
```bash
  rails server
```

Corre el script de tailwindcss para que se genere cuando hagamos cambios

```bash
  yarn build:css --watch
```

