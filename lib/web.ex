defmodule PlugMemcacheExample.Web do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/get" do
    send_resp(conn, 200, Server.get(Server))
  end

  get "/set" do
    { :ok, pid } = Memcache.start_link()
    json = ~s({"age":44,"name":"Steve Irwin","nationality":"Australian"})
    { :ok } = Memcache.set(pid, "key", json)

    send_resp(conn, 200, "ok")
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
