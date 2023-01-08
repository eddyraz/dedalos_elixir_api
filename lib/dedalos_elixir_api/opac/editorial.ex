defmodule DedalosElixirApi.Opac.Editorial do
  use Ecto.Schema
  import Ecto.Changeset

  schema "opac_editorial" do
    #field :id, :integer
    field :nombre_editorial, :string
    field :pais_origen_id, :integer

    #Associations
    has_many :libros, Libros.Editorial_Iad

    timestamps()
  end

  @doc false
  def changeset(editorial, attrs) do
    editorial
    |> cast(attrs, [:id, :nombre_editorial, :pais_origen_id])
    |> validate_required([:id, :nombre_editorial, :pais_origen_id])
  end
end
