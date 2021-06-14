defmodule GetFlightsWeb.ProjectController do
  use GetFlightsWeb, :controller
  alias GetFlights.Management
  alias GetFlights.Repo
  import Ecto.Query
  alias GetFlights.Management.Project

  action_fallback GetFlightsWeb.FallbackController

  def index(conn, _params) do
    flights = Management.list_flights()
    render(conn, "index.json", flights: flights)
  end

  def create(conn, %{"project" => project_params}) do
    with {:ok, %Project{} = project} <- Management.create_project(project_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.project_path(conn, :show, project))
      |> render("show.json", project: project)
    end
  end

  def show(conn, %{"flight_id" => flight_id}) do
    project = Management.get_flight!(flight_id)
    json(conn, %{Number: project.number, DepartureTime: project.departuretime, ArrivalTime: project.arrivaltime})
  end

   #def show(conn, %{"flight_id" => flight_id}) do
    #project = Management.get_project!(flight_id)
    #render(conn, "show.json", project: project)
    #json(conn, %{id: flight_id})
    #json(conn, %{number: number})
  #end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Management.get_project!(id)

    with {:ok, %Project{} = project} <- Management.update_project(project, project_params) do
      render(conn, "show.json", project: project)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Management.get_project!(id)

    with {:ok, %Project{}} <- Management.delete_project(project) do
      send_resp(conn, :no_content, "")
    end
  end
end
