# DiscordExExample

Example bot written with [DiscordEx](https://github.com/rmcafee/discord_ex).

## Usage

### Quick start

```
git clone https://github.com/marqin/discord_ex_example/
cd discord_ex_example
export DISCORD_BOT_TOKEN="PUT_HERE_YOUR_SECRET_TOKEN_FROM_DISCORD"
mix deps.get
iex -S mix
```

And your bot will be running.

If you don't want to use system shell variables for token, you can also
configure it in `config/secret.exs` (more info on that is in comment in
`config/config.exs`).

### More to read

* [How to register your bot and add it to server?](https://discordapp.com/developers/docs/topics/oauth2)
* [Discord API docs](https://discordapp.com/developers/docs/intro)
* [DiscordEx docs](https://hexdocs.pm/discord_ex/)

### Bonus

If you are in `iex -S mix` you can type `recompile()` and your bot code will
be hot-swaped without disconnecting bot.

Base of this project was generated with command:
`mix new discord_ex_example --sup`
