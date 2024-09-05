defmodule SalarioAppWeb.SalarioHTML do
  use SalarioAppWeb, :html

  # Esta línea embebe todas las plantillas en el directorio salario
  embed_templates "salario/*"
end
