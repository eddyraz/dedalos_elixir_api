defmodule DedalosElixirApiWeb.LibrosView do
  use DedalosElixirApiWeb, :view
  alias DedalosElixirApiWeb.LibrosView


  def render("index.json", %{opac_libro_legacy: opac_libro_legacy}) do
    %{data: render_many(opac_libro_legacy, LibrosView, "libros.json")}
  end

  def render("show.json", %{libros: libros}) do
    %{data: render_one(libros, LibrosView, "libros.json")}
  end

  def render("libros.json", %{libros: books}) do

    libros = books |> List.first()

    #libros = books

    %{
      no_reg: libros.no_reg,
      signatura: libros.signatura,
      fecha_registro: libros.fecha_registro,
      título: libros.título,
      edición: libros.edición,
      año_impr: libros.año_impr,
      idioma: libros.idioma_id,
      localización: libros.localización,
      resumen: libros.resumen,
      baja: libros.baja,
      solo_consulta: libros.solo_consulta,
      en_reparación: libros.en_reparación,
      isbn: libros.isbn,
      tipo_de_soporte: libros.tipo_soporte_id,
      editorial: libros.editorial_id,
      colección: libros.colección_id,
      autor2_id: libros.autor2_id,
      autor_id: libros.autor_id,
      autor3_id: libros.autor3_id,
      ciudad: libros.ciudad,
      lugar_de_impresión: libros.lugar_de_impresión_id,
      tipo_soporte_id: libros.tipo_soporte_id
    }
  end
end
