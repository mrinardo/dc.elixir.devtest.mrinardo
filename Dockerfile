FROM elixir:latest

RUN apt-get update && \
    apt-get install -y postgresql-client \
    inotify-tools

RUN mkdir /app
WORKDIR /app
COPY . .

RUN mix local.hex --force
RUN mix deps.get && mix compile

RUN chmod +x entrypoint.sh
CMD ["./entrypoint.sh"]


