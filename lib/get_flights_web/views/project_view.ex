defmodule GetFlightsWeb.ProjectView do
  use GetFlightsWeb, :view
  alias GetFlightsWeb.ProjectView

  def render("index.json", %{flights: flights}) do
    %{data: render_many(flights, ProjectView, "project.json")}
  end

  def render("show.json", %{project: project}) do
    %{data: render_one(project, ProjectView, "project.json")}
  end

  def render("project.json", %{project: project}) do
    %{id: project.flight_id,
      origin: project.origin,
      destination: project.destination,
      departuredate: project.departuredate,
      departuretime: project.departuretime,
      arrivaldate: project.arrivaldate,
      arrivaltime: project.arrivaltime,
      number: project.number}
  end
end
