defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view

  def mount(_params, _session, socket) do
    IO.inspect(self(), label: "MOUNT")
    socket = assign(socket, brightness: 10)
    #IO.inspect(socket)
    {:ok, socket}
  end

  def render(assigns) do
    IO.inspect(self(), label: "RENDER")
    ~H"""
    <h1>Front Porch Ligth </h1>
    <div id="light">
      <div class="meter">
        <span style={"width: #{@brightness}%"}>
          <%= @brightness %>%
        </span>
      </div>
      <button phx-click="off">
          <img src="/images/light-off.svg">
      </button>
      <button phx-click="down">
          <img src="/images/down.svg">
      </button>
      <button phx-click="up">
          <img src="/images/up.svg">
      </button>
      <button phx-click="on">
          <img src="/images/light-on.svg">
      </button>
      <button phx-click="fire">
          <img src="/images/fire.svg">
      </button>
    </div>
    """
  end

  def handle_event("on", _, socket) do
    IO.inspect(self(), label: "EVENT")
    #raise "⚠️  This process will die"
    socket = assign(socket, brightness: 100)
    {:noreply, socket}
  end

  def handle_event("up", _, socket) do
    socket = update(socket, :brightness, &min(&1 +10, 100))
    {:noreply, socket}
  end

  def handle_event("down", _, socket) do
    socket = update(socket, :brightness, &max(&1 -10, 0))
    {:noreply, socket}
  end

  def handle_event("off", _, socket) do
    socket = assign(socket, brightness: 0)
    {:noreply, socket}
  end

  def handle_event("fire", _, socket) do
    socket = assign(socket, :brightness, Enum.random(1..100))
    {:noreply, socket}
  end
end
