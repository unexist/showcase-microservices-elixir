defmodule TodoServiceElixir.AdminTest do
  use TodoServiceElixir.DataCase

  alias TodoServiceElixir.Admin

  describe "todos" do
    alias TodoServiceElixir.Admin.User

    @valid_attrs %{name: "some name", description: "some description"}
    @update_attrs %{name: "some updated name", description: "some updated description"}
    @invalid_attrs %{name: nil, description: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_user()

      user
    end

    test "list_todos/0 returns all todos" do
      user = user_fixture()
      assert Admin.list_todos() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Admin.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Admin.create_user(@valid_attrs)
      assert user.name == "some name"
      assert user.description == "some description"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Admin.update_user(user, @update_attrs)
      assert user.name == "some updated name"
      assert user.description == "some updated description"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_user(user, @invalid_attrs)
      assert user == Admin.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Admin.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Admin.change_user(user)
    end
  end

  describe "todos" do
    alias TodoServiceElixir.Admin.Todo

    @valid_attrs %{name: "some name", description: "some description"}
    @update_attrs %{name: "some updated name", description: "some updated description"}
    @invalid_attrs %{name: nil, description: nil}

    def todo_fixture(attrs \\ %{}) do
      {:ok, todo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Admin.create_todo()

      todo
    end

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Admin.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Admin.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      assert {:ok, %Todo{} = todo} = Admin.create_todo(@valid_attrs)
      assert todo.name == "some name"
      assert todo.description == "some description"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admin.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{} = todo} = Admin.update_todo(todo, @update_attrs)
      assert todo.name == "some updated name"
      assert todo.description == "some updated description"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Admin.update_todo(todo, @invalid_attrs)
      assert todo == Admin.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Admin.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Admin.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Admin.change_todo(todo)
    end
  end
end
