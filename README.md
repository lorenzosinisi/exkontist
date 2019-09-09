# Exkontist - And Elixir client for Kontist API

**Client for Kontist APIs**

## NOTE 

Nothing in this repo is provided or linked to http://kontist.com, this is an independent repository
that is just using their API. Use at your own risk.

## Login

Login to get a Bearer token which has to be passed for each subsequent request

```elixir
{:ok, %{"token" => token}} = Exkontist.Client.login(username, password)
```

## Get a User 

Return a user and its settings

```elixir
Exkontist.Client.user(token)
```

## Get all bank accounts 

```elixir
Exkontist.Client.accounts(token)
```

## Get all transactions from one bank account 

```elixir
Exkontist.Client.account_transactions(account_id, token)
```

## Get all future transactions from one bank account 

```elixir
Exkontist.Client.future_transactions(account_id, token)
```

## Get all standing orders from one bank account 

```elixir
Exkontist.Client.standing_orders(account_id, token)
```

## Get all wire transfer suggestions from one bank account 

```elixir
Exkontist.Client.wire_transfer_suggestions(account_id, token)
```

## Get your monthly statement 

```elixir
Exkontist.Client.statement(year, month, token)
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `exkontist` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:exkontist, "~> 0.1.0"}
  ]
end
```

**TODO**

- implement post requests of the https://github.com/netnexus/IKontist/blob/master/src/kontist-client.ts
- write tests

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/exkontist](https://hexdocs.pm/exkontist).

