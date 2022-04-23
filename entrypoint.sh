#!/bin/sh

# This is the entry point for the Elixir development Docker container

# Wait until PostgreSQL is ready
while ! pg_isready -q -h $PGHOST -p $PGPORT -U $PGUSER
do
  echo "$(date) - waiting for PostgreSQL to start..."
  sleep 2
done

# Create the database and run the migrations, if needed
mix ecto.setup

# Starts Phoenix app
exec mix phx.server