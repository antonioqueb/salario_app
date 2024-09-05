defmodule SalarioAppWeb.ErrorJSONTest do
  use SalarioAppWeb.ConnCase, async: true

  test "renders 404" do
    assert SalarioAppWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert SalarioAppWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
