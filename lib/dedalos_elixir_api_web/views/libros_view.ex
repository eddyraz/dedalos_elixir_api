defmodule DedalosElixirApiWeb.LibrosView do
  use DedalosElixirApiWeb, :view
  alias DedalosElixirApiWeb.LibrosView

  def render("index.json", %{opac_libro_legacy: opac_libro_legacy}) do
    %{data: render_many(opac_libro_legacy, LibrosView, "libros.json")}
  end

  def render("show.json", %{libros: libros}) do
    %{data: render_one(libros, LibrosView, "libros.json")}
  end

  def render("libros.json", %{libros: libros}) do
    %{
      no_reg: libros.no_reg,
      signatura: libros.signatura,
      fecha_registro: libros.fecha_registro,
      título: libros.título,
      edición: libros.edición,
      año_impr: libros.año_impr,
      idioma_id: libros.idioma_id,
      localización: libros.localización,
      resumen: libros.resumen,
      baja: libros.baja,
      solo_consulta: libros.solo_consulta,
      en_reparación: libros.en_reparación,
      isbn: libros.isbn,
      tipo_soporte_id: libros.tipo_soporte_id,
      editorial_id: libros.editorial_id,
      colección_id: libros.colección_id,
      autor: libros.autor,
      autor2: libros.autor2,
      autor2_id: libros.autor2_id,
      autor_id: libros.autor_id,
      ciudad: libros.ciudad,
      autor3_id: libros.autor3_id,
      lugar_de_impresión_id: libros.lugar_de_impresión_id
    }
  end
end
