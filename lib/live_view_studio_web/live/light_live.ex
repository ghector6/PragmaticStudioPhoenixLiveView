defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, brightness: 10)
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>Front Porch Ligth </h1>
    <div id="light">
      <div class="meter">
        <span>
          <%= @brightness %>%

        </span>
      </div>
    </div>
    """
  end

end
