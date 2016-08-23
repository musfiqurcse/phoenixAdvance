defmodule Ectoservice.Router do
  use Ectoservice.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Ectoservice.Auth , repo: Ectoservice.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Ectoservice do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :new, :create]
    get "/users/:id", UserController, :show
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/roles", RoleController
    resources "/permissionpages", PermissionPageController
     resources "/rolemappings", RoleMappingController
     get "/createpermission", PermissionPageController, :create_permission
     post "/createpermission", PermissionPageController, :submit_permission
  end
  scope "/api", Ectoservice do
    pipe_through :browser
    get "/api/user", UserController, :allUser
  end

  # Other scopes may use custom stacks.
  # scope "/api", Ectoservice do
  #   pipe_through :api
  # end
end
