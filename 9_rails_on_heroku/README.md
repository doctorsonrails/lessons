# Rails on Heroku

We have our Rails app. Let's git it up. Setup a Github repo for it, then run

```
git init
git add . 
git status
git commit -am "Initial app with CV Section"
git remote add origin git@github.com:USERNAME/REPOSITORY.git
git push -u origin master
```

Now let's get it on Heroku.

We need to make a few small changes. Heroku doesn't support Sqlite so we need to use PostgreSQL for this.

Change your Gemfile to set the different databases up:
```
group :development, :test do
  gem 'sqlite3'
end
group :production do 
  gem 'pg'
end
```

If you don't have postgres installed, you may need to run `bundle install --without production` from now on, so it doesn't try to install the PG gem on your machine.

Now we can create a heroku app and push it live:

```
heroku login
heroku create your-app-name
git status
git commit -am "Change database to PG for Heroku"
git push heroku master
heroku run rake db:migrate
```

It's worth adding a couple of things to improve the performance of your Heroku app. Let's use Thin as our webserver, rather than the default of WEBrick

Add `gem 'thin'` to your Gemfile and bundle. We need to create a `Procfile`, which tells Heroku what we want to do when we launch our server. Create one with the line:

```
web: bundle exec rails server thin -p $PORT -e $RACK_ENV
```

Now commit your change and push to Github and Heroku. Visit your new Heroku app!