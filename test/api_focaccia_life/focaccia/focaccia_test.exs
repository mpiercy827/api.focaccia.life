defmodule ApiFocacciaLife.FocacciaTest do
  use ApiFocacciaLife.DataCase

  alias ApiFocacciaLife.Focaccia

  describe "users" do
    alias ApiFocacciaLife.Focaccia.User

    @valid_attrs %{email: "some email", name: "some name", session_token: "some session_token"}
    @update_attrs %{email: "some updated email", name: "some updated name", session_token: "some updated session_token"}
    @invalid_attrs %{email: nil, name: nil, session_token: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Focaccia.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Focaccia.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Focaccia.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Focaccia.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
      assert user.session_token == "some session_token"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Focaccia.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Focaccia.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert user.session_token == "some updated session_token"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Focaccia.update_user(user, @invalid_attrs)
      assert user == Focaccia.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Focaccia.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Focaccia.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Focaccia.change_user(user)
    end
  end

  describe "cacces" do
    alias ApiFocacciaLife.Focaccia.Cacc

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def cacc_fixture(attrs \\ %{}) do
      {:ok, cacc} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Focaccia.create_cacc()

      cacc
    end

    test "list_cacces/0 returns all cacces" do
      cacc = cacc_fixture()
      assert Focaccia.list_cacces() == [cacc]
    end

    test "get_cacc!/1 returns the cacc with given id" do
      cacc = cacc_fixture()
      assert Focaccia.get_cacc!(cacc.id) == cacc
    end

    test "create_cacc/1 with valid data creates a cacc" do
      assert {:ok, %Cacc{} = cacc} = Focaccia.create_cacc(@valid_attrs)
    end

    test "create_cacc/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Focaccia.create_cacc(@invalid_attrs)
    end

    test "update_cacc/2 with valid data updates the cacc" do
      cacc = cacc_fixture()
      assert {:ok, cacc} = Focaccia.update_cacc(cacc, @update_attrs)
      assert %Cacc{} = cacc
    end

    test "update_cacc/2 with invalid data returns error changeset" do
      cacc = cacc_fixture()
      assert {:error, %Ecto.Changeset{}} = Focaccia.update_cacc(cacc, @invalid_attrs)
      assert cacc == Focaccia.get_cacc!(cacc.id)
    end

    test "delete_cacc/1 deletes the cacc" do
      cacc = cacc_fixture()
      assert {:ok, %Cacc{}} = Focaccia.delete_cacc(cacc)
      assert_raise Ecto.NoResultsError, fn -> Focaccia.get_cacc!(cacc.id) end
    end

    test "change_cacc/1 returns a cacc changeset" do
      cacc = cacc_fixture()
      assert %Ecto.Changeset{} = Focaccia.change_cacc(cacc)
    end
  end
end
