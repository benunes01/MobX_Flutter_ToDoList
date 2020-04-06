#mobX

<h1>Aplicativo simples de uma lista de tarefas com Login</h1>

<h3>Gerência de estado: mobX</h3>

<h3>Depêndencias:</h3>
<br>
<h4> 
  mobx : O MobX é uma biblioteca de gerenciamento de estado que simplifica a conexão dos dados reativos do seu aplicativo com a interface do usuário. 
  <br>
  <br>
  flutter_mobx : Fornece o Observerwidget que escuta observáveis e recria automaticamente as alterações.
</h4>

<h3>Dev depêndencias:</h3>
<br>
<h4> 
  mobx_codegen : Gerador de código para MobX que adiciona suporte para anotar seu código com @observable, @computed, @action e também criando classes Store.
  <br>
  <br>
  build_runner : Gera o arquivo mobX.
</h4>
<br>
<h3>Para gerar os arquivos mobX com o build_runner:</h3>
<p>flutter packages pub run build_runner watch</p>


<br>
<br>

<h2>Gerências de estados usadas no App</h2>
<h3>Login:</h3>
<h4>Validar dados do email com um RegEx</h4>
<h4>Validar dados do password só aceitando pelo menos 6 dígitos</h4>
<h4>Botão de Login só fica ativo se os dois campos estiverem válidos</h4>
<h4>Quando aperta o botão de Login, aparece um CircularProgress para depois ir para a tela de tarefas</h4>

<br>
<br>

<h3>Lista de tarefas:</h3>
<h4>Não aceitar o titulo da lista como vazio</h4>
<h4>Botão de 'add' só aparecer se o campo não tiver vazio</h4>
<h4>Criando ObservableList para que o mobX consiga notar alterações dentro da Lista</h4>
<h4>Marcar como lido quando clicar na tarefa</h4>
