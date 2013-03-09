# Custom Controller (Watch and replicate)

We now want to add a URL that shows all these sections together in a nice Résumé, so that the user can go to http://localhost:3000 and see their resume in one place.

Let's create a resumes controller that will have a show action, to show a resume:

```
rails generate controller resumes
```

Add a show action to the new controller in `app/controllers/resumes_controller.rb`.

```
class ResumesController < ApplicationController

  def show
  end

end
```

And add `show.html.haml` to `app/views/resumes` containing the header and footer from your Sinatra app to your `show.html.haml`, leaving a nice space in the middle for all the sections.

Finally, add a route to `config/routes.rb` that links our desired url (`/resume` to this action).

```
get '/resume' => "resumes#show" 
```

If you go to `http://localhost:3000/resumes` you should now see your holding text, but instead you see an error:

```
ActionView::MissingTemplate: Missing template resumes/show, application/show with {:locale=>[:en], :formats=>[:html], :handlers=>[:erb, :builder, :coffee]}
```

So what's going wrong? The problem is that Rails has no idea what HAML is. It's looking for ERB, Builder or Coffee templates - not HAML ones. Rails doesn't come with HAML installed - we need to add the Gem. Add `gem haml` to the Gemfile and bundle.

Restart your server (because your Gemfile has changed), refresh the page and you should see your resume. We've created a custom url linked to an action of a controller. Simple.

## Outputting something interesting

Now we have the routing set up, let's do something interesting with it!

We want to cycle through the resume sections and output them. This is a two stage process. Firstly, we need to retrieve the sections from the database, and secondly we want to display them.

Change your show route to:

```
  def show
    @sections = ResumeSection.all
  end
```

This get's all the resume sections from the database as an array and puts them into a variable called `@sections`.

In our template, we can now refer to this `@sections` variable and loop through each section, printing it out.

```
-@sections.each do |section|
    %section
        %h2= section.content
        %p= section.content
```

Refresh the page and you'll now see the sections added.

This is basically rendering a section template inside the resume template - so let's make that a formal thing.

**Ed - Partials**

Add a template called `app/views/resumes/_section.html.haml` with the content:
```
    %section
        %h2= section.content
        %p= section.content
```

and change the sections loop in `show.html.haml` template to:

```
=render partial: "section", collection: @sections
```

There's a nice shorthand for this:

```
=render @sections
```

How magic is that?! :)

## Topics Covered

* Creating controllers, actions and routes.
* Retrieving from the database.
* Looping and variables in HAML.