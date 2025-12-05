# PetStore

Start by installing asdf:
[`asdf version manager`]https://asdf-vm.com/
After installing asdf, add both asdf erlang and elixir:

[`asdf erlang`]https://github.com/asdf-vm/asdf-erlang
[`asdf elixir`]https://github.com/asdf-vm/asdf-elixir


```
$ asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
$ asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
```


### Following steps are required to be in project root
* local run
After adding the plugin run
```
$ asdf install
```

Assume you got docker install already, run this at project root:
```
$ docker compose up -d
```
$ Run the following:
`$ mix deps.get; mix ecto.create && mix ecto.migrate`




* Run `mix setup` to install and setup dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix
