# Sass

We can make our CSS files DRYer too, using Sass. 

Sass is built into Sinatra, so we don't need to add it to our Gemfile. 

Move your stylesheet into your views directory (because it's now going to be processed from Scss to CSS) and rename it to `cv.scss`.

Add an action in the server to render the file:

```
get '/cv.css' do
  scss :cv
end
```

Restart the server, and everything should be rendered as normal.

Now convert your stylesheet to Scss, adding nesting and variables.

Check it all works and push to Github and Heroku.

## Topics Covered

* Sass
    * Nesting
    * Variables