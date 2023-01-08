defmodule DedalosElixirApi.Opac.Ciudad do
  use Ecto.Schema
  import Ecto.Changeset

  schema "opac_ciudades" do
    #field :id, :integer
    field :nombre_ciudad, :string
    field :nombre_pais, :string
    field :nombre_pais_id, :integer

    #Associations
    has_many :libros , Libros.Lugar_De_Impresion_Id

    timestamps()
  end

  @doc false
  def changeset(ciudad, attrs) do
    ciudad
    |> cast(attrs, [:id, :nombre_ciudad, :nombre_pais, :nombre_pais_id])
    |> validate_required([:id, :nombre_ciudad, :nombre_pais, :nombre_pais_id])
  end
end
