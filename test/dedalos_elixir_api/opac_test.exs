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

  describe "opac_editorial" do
    alias DedalosElixirApi.Opac.Editorial

    import DedalosElixirApi.OpacFixtures

    @invalid_attrs %{id: nil, nombre_editorial: nil, pais_origen_id: nil}

    test "list_opac_editorial/0 returns all opac_editorial" do
      editorial = editorial_fixture()
      assert Opac.list_opac_editorial() == [editorial]
    end

    test "get_editorial!/1 returns the editorial with given id" do
      editorial = editorial_fixture()
      assert Opac.get_editorial!(editorial.id) == editorial
    end

    test "create_editorial/1 with valid data creates a editorial" do
      valid_attrs = %{id: 42, nombre_editorial: "some nombre_editorial", pais_origen_id: 42}

      assert {:ok, %Editorial{} = editorial} = Opac.create_editorial(valid_attrs)
      assert editorial.id == 42
      assert editorial.nombre_editorial == "some nombre_editorial"
      assert editorial.pais_origen_id == 42
    end

    test "create_editorial/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Opac.create_editorial(@invalid_attrs)
    end

    test "update_editorial/2 with valid data updates the editorial" do
      editorial = editorial_fixture()
      update_attrs = %{id: 43, nombre_editorial: "some updated nombre_editorial", pais_origen_id: 43}

      assert {:ok, %Editorial{} = editorial} = Opac.update_editorial(editorial, update_attrs)
      assert editorial.id == 43
      assert editorial.nombre_editorial == "some updated nombre_editorial"
      assert editorial.pais_origen_id == 43
    end

    test "update_editorial/2 with invalid data returns error changeset" do
      editorial = editorial_fixture()
      assert {:error, %Ecto.Changeset{}} = Opac.update_editorial(editorial, @invalid_attrs)
      assert editorial == Opac.get_editorial!(editorial.id)
    end

    test "delete_editorial/1 deletes the editorial" do
      editorial = editorial_fixture()
      assert {:ok, %Editorial{}} = Opac.delete_editorial(editorial)
      assert_raise Ecto.NoResultsError, fn -> Opac.get_editorial!(editorial.id) end
    end

    test "change_editorial/1 returns a editorial changeset" do
      editorial = editorial_fixture()
      assert %Ecto.Changeset{} = Opac.change_editorial(editorial)
    end
  end

  describe "opac_pais" do
    alias DedalosElixirApi.Opac.Pais

    import DedalosElixirApi.OpacFixtures

    @invalid_attrs %{codigo_iso: nil, id: nil, nombre: nil}

    test "list_opac_pais/0 returns all opac_pais" do
      pais = pais_fixture()
      assert Opac.list_opac_pais() == [pais]
    end

    test "get_pais!/1 returns the pais with given id" do
      pais = pais_fixture()
      assert Opac.get_pais!(pais.id) == pais
    end

    test "create_pais/1 with valid data creates a pais" do
      valid_attrs = %{codigo_iso: "some codigo_iso", id: 42, nombre: "some nombre"}

      assert {:ok, %Pais{} = pais} = Opac.create_pais(valid_attrs)
      assert pais.codigo_iso == "some codigo_iso"
      assert pais.id == 42
      assert pais.nombre == "some nombre"
    end

    test "create_pais/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Opac.create_pais(@invalid_attrs)
    end

    test "update_pais/2 with valid data updates the pais" do
      pais = pais_fixture()
      update_attrs = %{codigo_iso: "some updated codigo_iso", id: 43, nombre: "some updated nombre"}

      assert {:ok, %Pais{} = pais} = Opac.update_pais(pais, update_attrs)
      assert pais.codigo_iso == "some updated codigo_iso"
      assert pais.id == 43
      assert pais.nombre == "some updated nombre"
    end

    test "update_pais/2 with invalid data returns error changeset" do
      pais = pais_fixture()
      assert {:error, %Ecto.Changeset{}} = Opac.update_pais(pais, @invalid_attrs)
      assert pais == Opac.get_pais!(pais.id)
    end

    test "delete_pais/1 deletes the pais" do
      pais = pais_fixture()
      assert {:ok, %Pais{}} = Opac.delete_pais(pais)
      assert_raise Ecto.NoResultsError, fn -> Opac.get_pais!(pais.id) end
    end

    test "change_pais/1 returns a pais changeset" do
      pais = pais_fixture()
      assert %Ecto.Changeset{} = Opac.change_pais(pais)
    end
  end

  describe "opac_ciudad" do
    alias DedalosElixirApi.Opac.Ciudad

    import DedalosElixirApi.OpacFixtures

    @invalid_attrs %{id: nil, nombre_ciudad: nil, nombre_pais: nil, nombre_pais_id: nil}

    test "list_opac_ciudad/0 returns all opac_ciudad" do
      ciudad = ciudad_fixture()
      assert Opac.list_opac_ciudad() == [ciudad]
    end

    test "get_ciudad!/1 returns the ciudad with given id" do
      ciudad = ciudad_fixture()
      assert Opac.get_ciudad!(ciudad.id) == ciudad
    end

    test "create_ciudad/1 with valid data creates a ciudad" do
      valid_attrs = %{id: 42, nombre_ciudad: "some nombre_ciudad", nombre_pais: "some nombre_pais", nombre_pais_id: 42}

      assert {:ok, %Ciudad{} = ciudad} = Opac.create_ciudad(valid_attrs)
      assert ciudad.id == 42
      assert ciudad.nombre_ciudad == "some nombre_ciudad"
      assert ciudad.nombre_pais == "some nombre_pais"
      assert ciudad.nombre_pais_id == 42
    end

    test "create_ciudad/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Opac.create_ciudad(@invalid_attrs)
    end

    test "update_ciudad/2 with valid data updates the ciudad" do
      ciudad = ciudad_fixture()
      update_attrs = %{id: 43, nombre_ciudad: "some updated nombre_ciudad", nombre_pais: "some updated nombre_pais", nombre_pais_id: 43}

      assert {:ok, %Ciudad{} = ciudad} = Opac.update_ciudad(ciudad, update_attrs)
      assert ciudad.id == 43
      assert ciudad.nombre_ciudad == "some updated nombre_ciudad"
      assert ciudad.nombre_pais == "some updated nombre_pais"
      assert ciudad.nombre_pais_id == 43
    end

    test "update_ciudad/2 with invalid data returns error changeset" do
      ciudad = ciudad_fixture()
      assert {:error, %Ecto.Changeset{}} = Opac.update_ciudad(ciudad, @invalid_attrs)
      assert ciudad == Opac.get_ciudad!(ciudad.id)
    end

    test "delete_ciudad/1 deletes the ciudad" do
      ciudad = ciudad_fixture()
      assert {:ok, %Ciudad{}} = Opac.delete_ciudad(ciudad)
      assert_raise Ecto.NoResultsError, fn -> Opac.get_ciudad!(ciudad.id) end
    end

    test "change_ciudad/1 returns a ciudad changeset" do
      ciudad = ciudad_fixture()
      assert %Ecto.Changeset{} = Opac.change_ciudad(ciudad)
    end
  end

  describe "opac_autor" do
    alias DedalosElixirApi.Opac.Autor

    import DedalosElixirApi.OpacFixtures

    @invalid_attrs %{id: nil, nombre_autor: nil}

    test "list_opac_autor/0 returns all opac_autor" do
      autor = autor_fixture()
      assert Opac.list_opac_autor() == [autor]
    end

    test "get_autor!/1 returns the autor with given id" do
      autor = autor_fixture()
      assert Opac.get_autor!(autor.id) == autor
    end

    test "create_autor/1 with valid data creates a autor" do
      valid_attrs = %{id: 42, nombre_autor: "some nombre_autor"}

      assert {:ok, %Autor{} = autor} = Opac.create_autor(valid_attrs)
      assert autor.id == 42
      assert autor.nombre_autor == "some nombre_autor"
    end

    test "create_autor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Opac.create_autor(@invalid_attrs)
    end

    test "update_autor/2 with valid data updates the autor" do
      autor = autor_fixture()
      update_attrs = %{id: 43, nombre_autor: "some updated nombre_autor"}

      assert {:ok, %Autor{} = autor} = Opac.update_autor(autor, update_attrs)
      assert autor.id == 43
      assert autor.nombre_autor == "some updated nombre_autor"
    end

    test "update_autor/2 with invalid data returns error changeset" do
      autor = autor_fixture()
      assert {:error, %Ecto.Changeset{}} = Opac.update_autor(autor, @invalid_attrs)
      assert autor == Opac.get_autor!(autor.id)
    end

    test "delete_autor/1 deletes the autor" do
      autor = autor_fixture()
      assert {:ok, %Autor{}} = Opac.delete_autor(autor)
      assert_raise Ecto.NoResultsError, fn -> Opac.get_autor!(autor.id) end
    end

    test "change_autor/1 returns a autor changeset" do
      autor = autor_fixture()
      assert %Ecto.Changeset{} = Opac.change_autor(autor)
    end
  end
end
