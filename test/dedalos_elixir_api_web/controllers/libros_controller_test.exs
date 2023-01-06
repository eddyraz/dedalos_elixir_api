defmodule DedalosElixirApiWeb.LibrosControllerTest do
  use DedalosElixirApiWeb.ConnCase

  import DedalosElixirApi.OpacFixtures

  alias DedalosElixirApi.Opac.Libros

  @create_attrs %{
    autor: "some autor",
    autor2: "some autor2",
    autor2_id: 42,
    autor3_id: 42,
    autor_id: 42,
    año_impr: "some año_impr",
    baja: true,
    ciudad: "some ciudad",
    colección_id: 42,
    edición: "some edición",
    editorial_id: 42,
    en_reparación: true,
    fecha_registro: ~U[2023-01-04 22:01:00Z],
    idioma_id: 42,
    isbn: "some isbn",
    localización: "some localización",
    lugar_de_impresión_id: 42,
    no_reg: 42,
    resumen: "some resumen",
    signatura: "some signatura",
    solo_consulta: true,
    tipo_soporte_id: 42,
    título: "some título"
  }
  @update_attrs %{
    autor: "some updated autor",
    autor2: "some updated autor2",
    autor2_id: 43,
    autor3_id: 43,
    autor_id: 43,
    año_impr: "some updated año_impr",
    baja: false,
    ciudad: "some updated ciudad",
    colección_id: 43,
    edición: "some updated edición",
    editorial_id: 43,
    en_reparación: false,
    fecha_registro: ~U[2023-01-05 22:01:00Z],
    idioma_id: 43,
    isbn: "some updated isbn",
    localización: "some updated localización",
    lugar_de_impresión_id: 43,
    no_reg: 43,
    resumen: "some updated resumen",
    signatura: "some updated signatura",
    solo_consulta: false,
    tipo_soporte_id: 43,
    título: "some updated título"
  }
  @invalid_attrs %{autor: nil, autor2: nil, autor2_id: nil, autor3_id: nil, autor_id: nil, año_impr: nil, baja: nil, ciudad: nil, colección_id: nil, edición: nil, editorial_id: nil, en_reparación: nil, fecha_registro: nil, idioma_id: nil, isbn: nil, localización: nil, lugar_de_impresión_id: nil, no_reg: nil, resumen: nil, signatura: nil, solo_consulta: nil, tipo_soporte_id: nil, título: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all opac_libro_legacy", %{conn: conn} do
      conn = get(conn, Routes.libros_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create libros" do
    test "renders libros when data is valid", %{conn: conn} do
      conn = post(conn, Routes.libros_path(conn, :create), libros: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.libros_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "autor" => "some autor",
               "autor2" => "some autor2",
               "autor2_id" => 42,
               "autor3_id" => 42,
               "autor_id" => 42,
               "año_impr" => "some año_impr",
               "baja" => true,
               "ciudad" => "some ciudad",
               "colección_id" => 42,
               "edición" => "some edición",
               "editorial_id" => 42,
               "en_reparación" => true,
               "fecha_registro" => "2023-01-04T22:01:00Z",
               "idioma_id" => 42,
               "isbn" => "some isbn",
               "localización" => "some localización",
               "lugar_de_impresión_id" => 42,
               "no_reg" => 42,
               "resumen" => "some resumen",
               "signatura" => "some signatura",
               "solo_consulta" => true,
               "tipo_soporte_id" => 42,
               "título" => "some título"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.libros_path(conn, :create), libros: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update libros" do
    setup [:create_libros]

    test "renders libros when data is valid", %{conn: conn, libros: %Libros{id: id} = libros} do
      conn = put(conn, Routes.libros_path(conn, :update, libros), libros: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.libros_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "autor" => "some updated autor",
               "autor2" => "some updated autor2",
               "autor2_id" => 43,
               "autor3_id" => 43,
               "autor_id" => 43,
               "año_impr" => "some updated año_impr",
               "baja" => false,
               "ciudad" => "some updated ciudad",
               "colección_id" => 43,
               "edición" => "some updated edición",
               "editorial_id" => 43,
               "en_reparación" => false,
               "fecha_registro" => "2023-01-05T22:01:00Z",
               "idioma_id" => 43,
               "isbn" => "some updated isbn",
               "localización" => "some updated localización",
               "lugar_de_impresión_id" => 43,
               "no_reg" => 43,
               "resumen" => "some updated resumen",
               "signatura" => "some updated signatura",
               "solo_consulta" => false,
               "tipo_soporte_id" => 43,
               "título" => "some updated título"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, libros: libros} do
      conn = put(conn, Routes.libros_path(conn, :update, libros), libros: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete libros" do
    setup [:create_libros]

    test "deletes chosen libros", %{conn: conn, libros: libros} do
      conn = delete(conn, Routes.libros_path(conn, :delete, libros))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.libros_path(conn, :show, libros))
      end
    end
  end

  defp create_libros(_) do
    libros = libros_fixture()
    %{libros: libros}
  end
end
