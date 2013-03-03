# Sinatra

Let's look at each other's CVs. 

We're going to create a web application which you will host locally, and which allows you to see each others files.

### Gemfile

This lists the libraries that your application is using.

* We need to start off by adding a "source" - the authority about the libraries you're using. To do this add `source 'https://rubygems.org'`
* Now let's list the libraries. We're going to just start with one - Sinatra, the web framework. Include this by adding the list `gem 'sinatra'`
* We can install the libraries using `bundle install` on the command line - this installs the gems you've specified plus their dependancies.

### Sinatra

* Let's create a basic Sinatra application to test everything's working:

```
require 'sinatra'

get '/hello' do
  "Hello, world!. It's #{Time.now} :)"
end
```

Run `bundle exec ruby server.rb` and visit `localhost:4567/hello` in your browser. You should see "Hello, World!" displayed with the current time! Simple. Refresh the page and see the time change. 

### Rendering your CV

Let's add another action to sinatra to render the CV. We're going to make this the default one that you see when you go to localhost:4567 - this is called the root or index action.

We're going to use `erb`, the default template engine to render our CV. Add this:

```
get '/' do
  erb :index
end
```

Now create two directories: `views` and `public`

* `views` contain things that should be process by Sinatra
* `public` contains things that can just be rendered in their existing state

Move your CV into the views directory as `index.erb`, and move your image and stylesheet into the public directory, as such:

```
mkdir views
mv cv.html views/index.erb

mkdir public
mv cv.css public/cv.css
mv img.jpg public/img.jpg
```

Restart the server, visit `localhost:4567` and you should now see your CV. You can now give your IP address to your classmates (run `ifconfig | grep 192` in the console to get it) and they should be able to see your CV on port 4567 (e.g. http://192.168.0.1:4567).

You have your first web application. 

We should change the links to the image and stylesheet to stop being relative (`./jeremy.jpg`) and start being absolute (`/jeremy.jpg`) as we are now working referencing from the point of view of a webserver, not a file system.

Push it up to Github for safe-keeping. Make sure you include the deleted files by either removing them or using the `a` (for all) flag on the commit.

```
git status
git add .
git status
git commit -am "Added Sinatra app"
git push
```

## Topics Covered

* What's a web framework?
* Sinatra - a very light framework.
* What are Gems? What is RubyGems?
* What is bundler
* What is an ip address / port.
* The basics of a web request. Browser asks, server gives.

* Ruby `require`
* Ruby blocks
* Ruby symbols