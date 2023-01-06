defmodule DedalosElixirApi.Opac.Libros do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:no_reg, :integer, autogenerate: false}
  

  schema "opac_libro_legacy" do
    field :signatura, :string
    field :fecha_registro, :utc_datetime
    field :título, :string
    field :edición, :string
    field :año_impr, :string
    field :idioma_id, :integer
    field :localización, :string
    field :resumen, :string
    field :baja, :boolean
    field :solo_consulta, :boolean
    field :en_reparación, :boolean
    field :isbn,  :string
    field :tipo_soporte_id, :integer
    field :editorial_id, :integer
    field :colección_id, :integer
    field :autor, :string
    field :autor2, :string 
    field :autor2_id, :integer
    field :autor_id, :integer
    field :ciudad,  :string
    field :autor3_id, :integer
    field :lugar_de_impresión_id,  :integer 
    
#    timestamps()
  end

  @doc false
  def changeset(libros, attrs) do
    libros
    |> cast(attrs, [:no_reg, :signatura, :fecha_registro, :título, :edición, :año_impr, :idioma_id, :localización, :resumen, :baja, :solo_consulta, :en_reparación, :isbn, :tipo_soporte_id, :editorial_id, :colección_id, :autor, :autor2, :autor2_id, :autor_id, :ciudad, :autor3_id, :lugar_de_impresión_id])
    |> validate_required([:no_reg, :signatura, :fecha_registro, :título, :edición, :año_impr, :idioma_id, :localización, :resumen, :baja, :solo_consulta, :en_reparación, :isbn, :tipo_soporte_id, :editorial_id, :colección_id, :autor, :autor2, :autor2_id, :autor_id, :ciudad, :autor3_id, :lugar_de_impresión_id])
  end
end
