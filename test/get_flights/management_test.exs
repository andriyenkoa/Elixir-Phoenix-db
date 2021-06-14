defmodule GetFlights.ManagementTest do
  use GetFlights.DataCase

  alias GetFlights.Management

  describe "flights" do
    alias GetFlights.Management.Project

    @valid_attrs %{arrivaldate: 42, arrivaltime: 42, departuredate: 42, departuretime: 42, destination: "some destination", flight_id: 42, number: "some number", origin: "some origin"}
    @update_attrs %{arrivaldate: 43, arrivaltime: 43, departuredate: 43, departuretime: 43, destination: "some updated destination", flight_id: 43, number: "some updated number", origin: "some updated origin"}
    @invalid_attrs %{arrivaldate: nil, arrivaltime: nil, departuredate: nil, departuretime: nil, destination: nil, flight_id: nil, number: nil, origin: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Management.create_project()

      project
    end

    test "list_flights/0 returns all flights" do
      project = project_fixture()
      assert Management.list_flights() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Management.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Management.create_project(@valid_attrs)
      assert project.arrivaldate == 42
      assert project.arrivaltime == 42
      assert project.departuredate == 42
      assert project.departuretime == 42
      assert project.destination == "some destination"
      assert project.flight_id == 42
      assert project.number == "some number"
      assert project.origin == "some origin"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, %Project{} = project} = Management.update_project(project, @update_attrs)
      assert project.arrivaldate == 43
      assert project.arrivaltime == 43
      assert project.departuredate == 43
      assert project.departuretime == 43
      assert project.destination == "some updated destination"
      assert project.flight_id == 43
      assert project.number == "some updated number"
      assert project.origin == "some updated origin"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_project(project, @invalid_attrs)
      assert project == Management.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Management.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Management.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Management.change_project(project)
    end
  end
end
