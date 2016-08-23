@metadoc
"""
yes, the template would be `web/templates/layout/other_layout.html.eex`
For a partial, lets say that you have in your controller
```  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end
```
you can create a partial like `web/templates/user/form.html.eex` and
then in your template `web/templates/user/new.html.eex` you can render the `form.html.eex` template using something like
```<%= render "form.html", changeset: @changeset %>
"""
