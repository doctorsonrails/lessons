# Heroku

Let's deploy your app to a web-server. Sign up for Heroku, which is who we'll be using for hosting.

Now we need to configure our app to run on Heroku. This involves writing a `config.ru` file as follows:

```
require './server'
run Sinatra::Application
```

Download the [Heroku Toolbelt](https://toolbelt.heroku.com) and create your app.

```
heroku login
heroku create your-app-name
```

This creates another remote version of your repository on Heroku.

And now we push this to Heroku using git push. This reboots the application.
```
git push heroku master
```

You can now see your app at http://your-app-name.herokuapp.com :)

## Topics Covered

* What is Heroku?
* Pushing a simple Heroku app