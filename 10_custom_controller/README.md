# Custom Controller

We now want to add a URL that shows all these sections together in a nice Résumé.

## Create the controller

Let's generate a new controller:

```
rails generate controller resumes
```

## Test Driven Development Time

**Ed: Testing**

We now want to create a custom action and we're going to do it through TDD. 

Add three fixtures for Resume Sections to `test/fixtures` and the following to `test/functional/resumes_controller_test.rb`

```
require 'test_helper'

class ResumesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end
end
```

This is saying we want to successfully get the show action of the resumes controller. Run the test with `rake` and you should get an error. I find this test output a little hard to read. We can improve it using the `turn` Gem.

Add `gem turn` to the `:test` group of your Gemfile and bundle. Now edit your `test/test_helper.rb` to include the following: 

```
require 'turn/autorun'
```

Rerun your tests and they should be a bit clearer. Let's look at the error: `No route matches {:controller=>"resumes", :action=>"show"}`. This is telling us that there is no route that allows it to visit the `show` action of the `resumes_controller`. The scaffolding did this for us automatically before, but we need to do it manually now, so let's add one. 

**Ed: Routing**

Add a route into config/routes.rb that links `/resume` to the `show` action of the `resumes_controller`.

```
get '/resume' => "resumes#show" 
```

Now run the tests again (`rake`) and not the next error: `The action 'show' could not be found for ResumesController`. Again, the scaffolding did this automatically for us before. Add a show action to `app/controllers/resources_controller.rb`

```
class ResumesController < ApplicationController

  def show
  end

end
```

Run the tests again and now we're told we have `Missing template resumes/show`.

Let's add a template. Create `app/views/resumes/show.html.haml` with some "Hello, World!" text in it. The filename tells Rails that we have a HAML template that needs to be compiled to HTML. Run the tests again. We get the same error! Let's dig deeper. The full error is:

```
ActionView::MissingTemplate: Missing template resumes/show, application/show with {:locale=>[:en], :formats=>[:html], :handlers=>[:erb, :builder, :coffee]}
```

So what's going wrong? The problem is that Rails has no idea what HAML is. It's looking for ERB, Builder or Coffee templates - not HAML ones. Rails doesn't come with HAML installed - we need to add the Gem. Add `gem haml` to the Gemfile and bundle.

Run the tests again, and you should be green!
```
assert_not_nil assigns(:resume_sections)
```

Restart your server (because your Gemfile has changed) and visit `localhost:3000/resume`. You should see your "Hello, World!" comment. We've created a custom url linked to an action of a controller. Simple.

## Outputting something interesting

Now let's doing something interesting with it!!

    assert_not_nil assigns(:resume_sections)
    
    get a different error: `<nil> expected to not be nil`. Look at the line referenced and you'll see we have:


## Topics Covered

* `rails g controller`
* Rails Tests
* `TDD`