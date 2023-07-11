
# Auth Sample App

Base application for the workshop [Authorization for Social Networks in Rails](https://codigofacilito.com/talleres/rails-autorizacion) in Código Facilito.

In this workshop we will learn to make the feature of private accounts that we see in Social Networks that we use daily.
For this we will learn about authorization with Pundit and we will apply advanced methods of Active Record to be able to integrate multiple associations between models.
We will go from the idea to the execution of a complex feature.


## Tech Stack

**Client:** TailwindCSS

**Server:** Rails 7, Ruby 3.1, PostgreSQL 14.1, Yarn 1.22


## Initial settings to run the project

Clone the project

```bash
  git clone git@github.com:GeorgePires/course-auth-sample-app.git
```

Enter the cloned directory

```bash
  cd course-auth-sample-app
```

Install dependencies

```bash
  bundle install
  yarn install
```

Prepare the database:

```bash
  rails db:create
  rails db:migrate
  rails db:seed
```

Start server
```bash
  rails server
```

Run the tailwindcss script so that it is generated when we make changes

```bash
  yarn build:css --watch
```

