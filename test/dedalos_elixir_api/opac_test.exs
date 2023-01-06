defmodule DedalosElixirApi.OpacTest do
  use DedalosElixirApi.DataCase

  alias DedalosElixirApi.Opac

  describe "opac_libro_legacy" do
    alias DedalosElixirApi.Opac.Libros

    import DedalosElixirApi.OpacFixtures

    @invalid_attrs %{no_reg: nil}

    test "list_opac_libro_legacy/0 returns all opac_libro_legacy" do
      libros = libros_fixture()
      assert Opac.list_opac_libro_legacy() == [libros]
    end

    test "get_libros!/1 returns the libros with given id" do
      libros = libros_fixture()
      assert Opac.get_libros!(libros.id) == libros
    end

    test "create_libros/1 with valid data creates a libros" do
      valid_attrs = %{no_reg: 42}

      assert {:ok, %Libros{} = libros} = Opac.create_libros(valid_attrs)
      assert libros.no_reg == 42
    end

    test "create_libros/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Opac.create_libros(@invalid_attrs)
    end

    test "update_libros/2 with valid data updates the libros" do
      libros = libros_fixture()
      update_attrs = %{no_reg: 43}

      assert {:ok, %Libros{} = libros} = Opac.update_libros(libros, update_attrs)
      assert libros.no_reg == 43
    end

    test "update_libros/2 with invalid data returns error changeset" do
      libros = libros_fixture()
      assert {:error, %Ecto.Changeset{}} = Opac.update_libros(libros, @invalid_attrs)
      assert libros == Opac.get_libros!(libros.id)
    end

    test "delete_libros/1 deletes the libros" do
      libros = libros_fixture()
      assert {:ok, %Libros{}} = Opac.delete_libros(libros)
      assert_raise Ecto.NoResultsError, fn -> Opac.get_libros!(libros.id) end
    end

    test "change_libros/1 returns a libros changeset" do
      libros = libros_fixture()
      assert %Ecto.Changeset{} = Opac.change_libros(libros)
    end
  end
end
