defmodule SalarioAppWeb.Router do
  use SalarioAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", SalarioAppWeb do
    pipe_through :browser

    # Ruta para la página de entrada donde está el formulario
    get "/", SalarioController, :index

    # Ruta para procesar el cálculo, que maneja el envío del formulario (POST)
    post "/calcular", SalarioController, :calcular
  end
end
