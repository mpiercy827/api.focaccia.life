FROM elixir:1.5.1

ENV MIX_ENV=prod
ARG DATABASE_PASSWORD
ARG DATABASE_HOST
ARG SECRET_KEY_BASE

COPY mix.exs mix.exs
COPY mix.lock mix.lock
COPY config config
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get
RUN mix deps.compile

COPY . .
RUN mix compile

CMD mix phx.server
