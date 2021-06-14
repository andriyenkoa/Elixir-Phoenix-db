defmodule GetFlightsWeb.ProjectControllerTest do
  use GetFlightsWeb.ConnCase

  alias GetFlights.Management
  alias GetFlights.Management.Project

  @create_attrs %{
    arrivaldate: 42,
    arrivaltime: 42,
    departuredate: 42,
    departuretime: 42,
    destination: "some destination",
    flight_id: 42,
    number: "some number",
    origin: "some origin"
  }
  @update_attrs %{
    arrivaldate: 43,
    arrivaltime: 43,
    departuredate: 43,
    departuretime: 43,
    destination: "some updated destination",
    flight_id: 43,
    number: "some updated number",
    origin: "some updated origin"
  }
  @invalid_attrs %{arrivaldate: nil, arrivaltime: nil, departuredate: nil, departuretime: nil, destination: nil, flight_id: nil, number: nil, origin: nil}

  def fixture(:project) do
    {:ok, project} = Management.create_project(@create_attrs)
    project
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all flights", %{conn: conn} do
      conn = get(conn, Routes.project_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create project" do
    test "renders project when data is valid", %{conn: conn} do
      conn = post(conn, Routes.project_path(conn, :create), project: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.project_path(conn, :show, id))

      assert %{
               "id" => id,
               "arrivaldate" => 42,
               "arrivaltime" => 42,
               "departuredate" => 42,
               "departuretime" => 42,
               "destination" => "some destination",
               "flight_id" => 42,
               "number" => "some number",
               "origin" => "some origin"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.project_path(conn, :create), project: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update project" do
    setup [:create_project]

    test "renders project when data is valid", %{conn: conn, project: %Project{id: id} = project} do
      conn = put(conn, Routes.project_path(conn, :update, project), project: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.project_path(conn, :show, id))

      assert %{
               "id" => id,
               "arrivaldate" => 43,
               "arrivaltime" => 43,
               "departuredate" => 43,
               "departuretime" => 43,
               "destination" => "some updated destination",
               "flight_id" => 43,
               "number" => "some updated number",
               "origin" => "some updated origin"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, project: project} do
      conn = put(conn, Routes.project_path(conn, :update, project), project: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete project" do
    setup [:create_project]

    test "deletes chosen project", %{conn: conn, project: project} do
      conn = delete(conn, Routes.project_path(conn, :delete, project))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.project_path(conn, :show, project))
      end
    end
  end

  defp create_project(_) do
    project = fixture(:project)
    %{project: project}
  end
end
