# Deliverycenter Elixir Test - Solução

Solução do [Elixir Test da Deliverycenter](https://github.com/deliverycenter/dc.elixir.devtest) criada por João Maurício Rinardo.

Esta é uma aplicação Phoenix que faz uso do banco de dados PostgreSQL. Para executá-la, temos duas opções:

## 1. Executando a aplicação localmente

Para isso é necessário ter o Elixir e o PostgreSQL instalados em seu computador.

Caso você não possua o PostgreSQL instalado localmente em seu computador, utilize o comando abaixo no Linux para iniciar um container Docker do banco de dados PostgreSQL:

  ```console
  sudo docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
  ```

Para iniciar a aplicação é necessário seguir os seguintes passos:

  * Instalar dependências com o `mix deps.get`
  * Criar o banco de dados e tabelas com o `mix ecto.setup`
  * Iniciar o servidor Phoenix com o `mix phx.server`

Acesse o endpoint **http://localhost:4000/parser** para executar o módulo Parser, gravar os dados no banco de dados e receber um JSON como resposta.

## 2. Executando a aplicação em containers Docker

Execute o comando abaixo no diretório raíz do projeto para criar as imagens para os containers:

  ```console
  sudo docker-compose build
  ```

Teremos um container chamado *"elixir"* para a aplicação Phoenix e outro chamado *"db"* para o banco de dados PostgreSQL. Utilize o comando abaixo para iniciar esse containers:

  ```console
  sudo docker-compose up
  ```

O ambiente será criado e em seguida aplicação será inicializada.

Acesse o endpoint **http://localhost:4000/parser** para executar o módulo Parser, gravar os dados no banco de dados e receber um JSON como resposta.

## Testes unitários

Os testes unitários criados para os módulos da aplicação podem ser executados conforme opções abaixo:

  * Testes unitários do parser:

    ```console
    MIX_ENV=test mix test test/deliverycenter_elixir/parser/parser_test.exs
    ```
  * Todos os testes unitários:

    ```console
    MIX_ENV=test mix test
    ```
  * Cobertura dos testes unitários:

    ```console
    MIX_ENV=test mix coveralls
    ```

Caso esteja utilizando o Docker, siga este exemplo para execução dos testes:

```console
docker-compose run -e "MIX_ENV=test" elixir mix test
```


