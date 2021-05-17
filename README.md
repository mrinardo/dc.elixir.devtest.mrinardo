# Deliverycenter Elixir Test

O Teste consiste em realizar um Pull Request (e apenas 1 Pull Request) realizando o que está sendo proposto.

A aplicação consiste em um parser do arquivo .json no formato a baixo:

  - priv/payload/payload.json

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


### Após a finalização do teste, ele deve ser entregue seguindo estes passos:
1. Crie um novo repositório
2. No repositório novo, clique importar código:
![image](https://user-images.githubusercontent.com/22237876/118177366-fa7a7700-b408-11eb-8ac3-4fe92758db03.png)

3. Adicione o seguinte repo: https://github.com/deliverycenter/dc.ruby.devtest
![image](https://user-images.githubusercontent.com/22237876/118177376-fd756780-b408-11eb-8cb1-530516902db9.png)

4. Mude a visibilidade do projeto para privado
![image](https://user-images.githubusercontent.com/22237876/118177453-167e1880-b409-11eb-9ebc-bfe6d0a76b78.png)
![image](https://user-images.githubusercontent.com/22237876/118177483-20a01700-b409-11eb-9c48-b759a9346f2e.png)
![image](https://user-images.githubusercontent.com/22237876/118177497-2564cb00-b409-11eb-9760-b671f9d8eced.png)

5. Por fim, convide o usuário **deliverycenter-devs** como colaborador
![image](https://user-images.githubusercontent.com/22237876/118177547-39103180-b409-11eb-8884-50f4526f6ed7.png)

6. Abra um PullRequest em seu repositório com o código alterado, para que possamos avaliar as alterações realizadas por você em relação à base do teste

#
*Sinta-se à vontade para alterar, organizar e limpar o código como achar necessário, assim como criar novos casos de teste, documentar o projeto e utilizar ferramentas que melhoram a qualidade e confiabilidade do código. A avaliação ocorrerá em acordo com o esforço colocado no projeto.*
