defmodule DedalosElixirApiWeb.LibrosController do
  use DedalosElixirApiWeb, :controller

  alias DedalosElixirApi.Opac
  alias DedalosElixirApi.Opac.Libros

  action_fallback DedalosElixirApiWeb.FallbackController

  def index(conn, _params) do
    opac_libro_legacy = Opac.list_opac_libro_legacy()
    render(conn, "index.json", opac_libro_legacy: opac_libro_legacy)
  end

#  def create(conn, %{"libros" => libros_params}) do
#    with {:ok, %Libros{} = libros} <- Opac.create_libros(libros_params) do
#      conn
#      |> put_status(:created)
#      |> put_resp_header("location", Routes.libros_path(conn, :show, libros))
#      |> render("show.json", libros: libros)
#    end
#  end

  def show(conn, %{"id" => id}) do
    libros = Opac.get_libros!(id)
    render(conn, "show.json", libros: libros)
  end

  def update(conn, %{"id" => id, "libros" => libros_params}) do
    libros = Opac.get_libros!(id)

    with {:ok, %Libros{} = libros} <- Opac.update_libros(libros, libros_params) do
      render(conn, "show.json", libros: libros)
    end
  end

  def delete(conn, %{"id" => id}) do
    libros = Opac.get_libros!(id)

    with {:ok, %Libros{}} <- Opac.delete_libros(libros) do
      send_resp(conn, :no_content, "")
    end
  end
end
