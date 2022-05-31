defmodule DagurlWeb.PageController do
  use DagurlWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
