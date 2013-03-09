# Making It Personal

So we have now added an editing interface to our old resumes. Let's take it a step further and add the ability to have multiple users with multiple resumes.

We'll start by generating a user model and we'll add some scaffolding to make our lives easier:
```
rails g scaffold user name:string email:string phone:string address:text
```

Run `rake db:migrate` and add some users.

Now, let's attach the resume sections to a user. Create a migration to change our database.

```
rails g migration add_user_id_to_resume_sections
```

Add the content:

```
add_column :resume_sections, :user_id, :integer
```

Run `rake db:migrate`

We need to add the ability to select a user for a resume_section.

Rename `app/views/resume_sections/_form.html.erb` to `app/views/resume_sections/_form.html.haml` and convert it to HAML.

Add in a section for the user_id:

```
.field
    =f.label :user_id
    %br
    =f.collection_select :user_id, User.order(:name), :id, :name
```

