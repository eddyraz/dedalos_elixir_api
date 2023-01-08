defmodule DedalosElixirApiWeb.LibrosController do
  use DedalosElixirApiWeb, :controller

  alias DedalosElixirApi.Opac
  alias DedalosElixirApi.Opac.Libros

  action_fallback DedalosElixirApiWeb.FallbackController



  def index(conn, params) do
    par = params
    opac_libro_legacy = Opac.list_libros(params)
    render(conn, "index.json", opac_libro_legacy: opac_libro_legacy)
  end


  def index_all(conn, params) do
    opac_libro_legacy = Opac.get_all_libros()
    render(conn, "index.json", opac_libro_legacy: opac_libro_legacy)
  end



  def show(conn, %{"id" => no_reg}) do
    libros = Opac.get_libro(no_reg)
    render(conn, "show.json", libros: libros)
  end





end
