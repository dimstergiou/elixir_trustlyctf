defmodule ElixirTrustlyctfWeb.Router do
  use ElixirTrustlyctfWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirTrustlyctfWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/7gJm1Jjr", PageController, :level1
    get "/LkBMv9M0", PageController, :level2
    get "/8eJbX9XY", PageController, :level4
    get "/KyJgxBXo", PageController, :level7
    get "/1NBvNBZQ", PageController, :level9
    post "/1NBvNBZQ", PageController, :level9_post
    get "/pGnEzJEm", PageController, :level12
    get "/ydBRzB1l", PageController, :level13
    get "/level13.old", PageController, :level13_flag
    get "/level13.backup", PageController, :level13_flag
    get "/level13.~", PageController, :level13_flag
    get "/8ZJwLBPD", PageController, :level15
    post "/8ZJwLBPD", PageController, :level15_post
    get "/gRJVOBe2", PageController, :level16
    get "/NjnLg9qx", PageController, :level17
    get "/eVBX19r8", PageController, :level19
    post "/eVBX19r8", PageController, :level19_post
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirTrustlyctfWeb do
  #   pipe_through :api
  # end
end
