defmodule DedalosElixirApi.Repo.Migrations.CreateOpacLibroLegacy do
  use Ecto.Migration

  def change do
    create table(:opac_libro_legacy) do
      add :no_reg, :integer

      timestamps()
    end
  end
end
