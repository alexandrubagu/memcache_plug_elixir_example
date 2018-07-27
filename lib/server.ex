defmodule Server do
  use GenServer

  @ttl 1000
  @key "key"
  @memcached :memcached

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(_opts) do
    {:ok, pid} = Memcache.start_link()
    :global.register_name(@memcached, pid)

    send(self(), :store)

    {:ok, %{}}
  end

  def get(pid) do
    GenServer.call(pid, :get)
  end

  def handle_call(:get, _from, state) do
    {:reply, Map.get(state, @key), state}
  end

  def handle_info(:store, state) do
    pid = :global.whereis_name(@memcached)
    {:ok, value} = Memcache.get(pid, @key)

    Process.send_after(self(), :store, @ttl)
    {:noreply, Map.put(state, @key, value)}
  end
end
