defmodule SalarioAppWeb.SalarioController do
  use SalarioAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def calcular(conn, %{"nombre" => nombre, "sueldo" => sueldo_str}) do
    sueldo = String.to_float(sueldo_str)

    sueldo_anual = sueldo * 12
    sueldo_mensual = sueldo
    sueldo_semanal = sueldo / 4
    sueldo_diario = sueldo / 30
    sueldo_hora = sueldo / (30 * 8)

    render(conn, "resultado.html", nombre: nombre, sueldo_anual: sueldo_anual, sueldo_mensual: sueldo_mensual, sueldo_semanal: sueldo_semanal, sueldo_diario: sueldo_diario, sueldo_hora: sueldo_hora)
  end
end
