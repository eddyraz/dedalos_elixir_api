defmodule DedalosElixirApi.Opac.Libros do
  use Ecto.Schema
  import Ecto.Changeset

  schema "opac_libro_legacy" do
    field :no_reg, :integer
    field :signatura, :string
    field :fecha_registro, :utc_datetime
    field :título, :string
    field :edición, :string
    field :año_impr, :string
    field :idioma_id, :integer
    field :localización, :string
    field :resumen, :string 

    timestamps()
  end

  @doc false
  def changeset(libros, attrs) do
    libros
    |> cast(attrs, [:no_reg])
    |> validate_required([:no_reg])
  end
end
