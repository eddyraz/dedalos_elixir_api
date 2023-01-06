defmodule DedalosElixirApi.Opac do
  @moduledoc """
  The Opac context.
  """

  import Ecto.Query, warn: false
  alias DedalosElixirApi.Repo

  alias DedalosElixirApi.Opac.Libros


  def list_opac_libro_legacy do
     Repo.all(Libros)
  end


  def get_libro(no_reg) do
    Repo.get_by!(Libros, [no_reg: no_reg])
    end
end
