defmodule ApiFocacciaLifeWeb.CaccControllerTest do
  use ApiFocacciaLifeWeb.ConnCase

  alias ApiFocacciaLife.Focaccia
  alias ApiFocacciaLife.Focaccia.Cacc

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:cacc) do
    {:ok, cacc} = Focaccia.create_cacc(@create_attrs)
    cacc
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cacces", %{conn: conn} do
      conn = get conn, cacc_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cacc" do
    test "renders cacc when data is valid", %{conn: conn} do
      conn = post conn, cacc_path(conn, :create), cacc: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, cacc_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, cacc_path(conn, :create), cacc: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cacc" do
    setup [:create_cacc]

    test "renders cacc when data is valid", %{conn: conn, cacc: %Cacc{id: id} = cacc} do
      conn = put conn, cacc_path(conn, :update, cacc), cacc: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, cacc_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, cacc: cacc} do
      conn = put conn, cacc_path(conn, :update, cacc), cacc: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cacc" do
    setup [:create_cacc]

    test "deletes chosen cacc", %{conn: conn, cacc: cacc} do
      conn = delete conn, cacc_path(conn, :delete, cacc)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, cacc_path(conn, :show, cacc)
      end
    end
  end

  defp create_cacc(_) do
    cacc = fixture(:cacc)
    {:ok, cacc: cacc}
  end
end
