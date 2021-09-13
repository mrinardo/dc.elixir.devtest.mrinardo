# Deliverycenter Elixir Test - Solução

Solução do [Elixir Test da Deliverycenter](https://github.com/deliverycenter/dc.elixir.devtest) criada por João Maurício Rinardo.

Esta é uma aplicação Phoenix que faz uso do banco de dados PostgreSQL. Caso você não tenha o PostgreSQL instalado localmente em seu computador, utilize o comando abaixo no Linux para iniciar um container Docker do banco de dados PostgreSQL:

  ```console
  sudo docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
  ```

Para iniciar a aplicação é necessário seguir os seguintes passos:

  * Instalar dependências com o `mix deps.get`
  * Criar o banco de dados e tabelas com o `mix ecto.setup`
  * Iniciar o servidor Phoenix com o `mix phx.server`

Acesse o endpoint **http://localhost:4000/parser** para executar o módulo Parser, gravar os dados no banco de dados e receber um JSON como resposta.

Adicionalmente é possível também:

  * Realizar os testes unitários do parser com o `MIX_ENV=test mix test test/deliverycenter_elixir/parser/parser_test.exs`
  * Realizar todos os testes unitários com o `MIX_ENV=test mix test`
  * Verificar cobertura dos testes unitários com o `MIX_ENV=test mix coveralls`


