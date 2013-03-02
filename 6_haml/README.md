# HAML

HTML is a pain to write. Remembering to close tags, such a high risk of typos etc. We use HAML, which compiles down to HTML.

It's easy to get started. 

* Add `gem haml` to your Gemfile and run `bundle install`. 
* Change the call to `erb :index` to `haml :index` in your server. 
* Convert your template from HTML to HAML.

Simple, and so much DRYer. 

**Don't forget to add your changes to git.**

## Topics Covered

* Templates
* HAML
    * Doctype
    * Defining by elements, ids or classes.
    * Attributes