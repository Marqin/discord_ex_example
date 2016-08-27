defmodule DiscordExExample.Worker do

  alias DiscordEx.Client.Helpers.MessageHelper
  alias DiscordEx.RestClient.Resources.Channel

  def start_link(opts \\ []) do
    DiscordEx.Client.start_link(opts)
  end

  def handle_event({:message_create, payload}, state) do
    # ignore messages from bots
    if ! payload.data["author"]["bot"] do
      # We start new background Task, so we can process next messages
      # while this one blocks.
      Task.start fn -> process_message(payload, state) end
    end
    {:ok, state}
  end

  def handle_event({_event, _payload}, state) do
    {:ok, state}
  end

  ###########

  def process_message(payload, state) do
    prefix = Application.get_env(:discord_ex_example, :cmd_prefix)
    parsed_cmd = MessageHelper.msg_command_parse(payload, prefix)
    process_command(parsed_cmd, payload, state)
  end

  def process_command({"info", _}, payload, state) do
    msg = "This is example bot made by Marqin with DiscordEx."
    Channel.send_message(state[:rest_client], payload.data["channel_id"], %{content: msg})
  end

  def process_command({"head", nil}, payload, state) do
    msg = "Usage: .head LIST OF WORDS"
    Channel.send_message(state[:rest_client], payload.data["channel_id"], %{content: msg})
  end

  def process_command({"head", args}, payload, state) do
    [head|tail] = String.split(args)
    msg = "First word is: " <> head
    Channel.send_message(state[:rest_client], payload.data["channel_id"], %{content: msg})
  end

  # This is our fallback for when user uses unknown command.
  def process_command(_, payload, state) do
    :noop
  end

end
