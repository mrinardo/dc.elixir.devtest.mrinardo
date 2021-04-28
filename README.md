# Deliverycenter Elixir Test

O Teste consiste em realizar um Pull Request (e apenas 1 Pull Request) realizando o que está sendo proposto.

A aplicação consiste em um parser do arquivo .json no formato a baixo:

  - priv/static/payload/payload.json

Você pode realizar qualquer modificação necessária para concluir o teste, incluindo:
  
  - Refatoração dos módulos criados
  - Cadastro do Payload no Banco de dados (estrutura pré-criada) #ecto
  - Inclusão ou exclusão de módulos, funções, comportamentos, etc.
  - Inclusão de bibliotecas de terceiros
  - Inclusão de Docker, docker compose, etc.
  - Inclusão de testes unitários, de integração, etc.

Será apenas obrigatório a correção do teste unitário:
  - test/deliverycenter_elixir/parser/parser_test.exs


Esta é uma aplicação Phoenix, para inicializá-la é necessário seguir os seguintes passos:

  * Instalar dependências com o `mix deps.get`
  * Criar o Banco de Dados com o `mix ecto.setup`
  * Realizar os testes com o `MIX_ENV=test mix test test/deliverycenter_elixir/parser/parser_test.exs`
