defmodule DiscordExExample do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: DiscordExExample.Worker.start_link(arg1, arg2, arg3)
      worker(DiscordExExample.Worker, [%{
        handler: DiscordExExample.Worker,
        token: Application.get_env(:discord_ex_example, :token)
      }]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DiscordExExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
