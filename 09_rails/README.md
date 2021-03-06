# Rails

## Introduction

So you have the basics of being able to create web pages and hosting them. Let's move on to Rails!

We're going to create a project where users can log in, add a record of things they've done, and then have a public page to show this off to others. It's a multi-user system backed by a database.

The workflow will be:
* Create a Rails app
* Add Résumé sections
* Link the sections into a Résumé
* Add users and authentication
* Add Markdown to the Résumé sections
* Reorder the Résumé Sections
* Add slugs.

## Creating an App

You should have the Rails gem installed. Let's create an app.

```
rails new YOUR_APP_NAME
```

We want to create a resource which represents a section of the Résumé. Rails has a command for that, which also creates some "scaffolding" (basic code). Run:

```
rails generate scaffold resume_section title:string content:text
```

**Ed: Introduce databases**

We need to store information about these Résumé sections somewhere so we create a database. By default, we're using SQLite - a very basic but easy-to-setup database. Create the database with:
```
rake db:create
```

We need to create table for our resume section. If you look in db/migrate you'll see a migration which creates a table for the resume sections. Let's run this migration:
```
rake db:migrate
```

Now we can start the Rails app and play with our scaffolded application. Run `rails s` and visit http://localhost:3000/resume_sections

Play around with creating some sections for your Résumé (You can copy the sections from the Sinatra Résumé).

You have a fully working Résumé section creation app. Easy. Let's see how it's working

**Ed: MVC**

## Topics Covered

* High-level intro to Rails
* `rails create`
* `rails generate`
* `rails server`
