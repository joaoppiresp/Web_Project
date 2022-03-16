#### Use Case 1 - trip creation
----------------------------------------------

Descrição   | Use Case destinado à criação de um novo plano de viagem e passos iniciais |
-------------|--------------------------------------------------------------------
Pre-Condições | 1. O utilizador pussui conta na plataforma ;<br/><br/>2. O utilizador tem acesso á internet;| 
Cenário Princ.| 1.Abre a página de login e efetua entrada na plataforma;<br/><br/>1.3. O utilizador é direcionado para a main page da plataforma;<br/><br/>  2. O utilizador seleciona o butão "new trip" que se encontra no canto superior direito<br/><br/>2.1.Aparece no centro do ecrã um pop-up menu onde o utilizador indicará os dados basicos da viagem<br/><br/> 3. O Utilizador introduz os dados iniciais da viagem nos campos de texto e menus (nome da viagem, destino principal, multiplos destinos ou não, adicionar amigos, etc);<br/><br/> 4. O utilizador seleciona o butão "create trip" para dar por finalizado o processo inicial."<br/><br/>4.1. O menu pop-up fecha e o utilizador é direcionado á nova página da viagem que criou;<br/><br/>5. Na página da viagem nova, o utilizador seleciona uma das secções disponiveis para começar a planear (Mapa, ou seja locais a visitar em formato de pins num mapa, transportation, flights, notes, create new section, etc). Todas as seções, ao selecionadas, abrem o seu pop-up dedicado ao assunto;| 
Cenário Alternativo| 1.1. As credenciais do utilizador não se encontram registadas no sistema;<br/><br/>  A) O login dá erro <br/><br/>1.2. O utilizador introduz uma password incorreta;<br/><br/>  B) O login dá erro<br/><br/>2.2. O utilizador fecha o menu e volta à interface principal da plataforma sem completar  ação de criar uma viagem nova.|
Pós Condições|  - O utilizador tenta os passos novamente;|
Cenários Exceção|  - O utilizador sai da plataforma a qualquer momento;|
Pós Condições|  - N\A|

#### Use Case 2 - search/select flights
----------------------------------------------

Descrição   | Use Case destinado à procura e seleção de voos (função acedida de vários lugares na plataforma) |
-------------|--------------------------------------------------------------------
Pre-Condições | 1. O utilizador pussui conta na plataforma ;<br/><br/>2. O utilizador tem acesso á internet;| 
Cenário Princ.| 1. O utilizador seleciona a secção de flights;<br/><br/>1.2. O menu pop-up da procura por voos é mostrado ao utilizador;<br/><br/>2. O utilizador introduz as informações relativas aos voos que pretende encontrar (dates, round-trip or not, etc)<br/><br/>3. É relizada uma chamada à API search flights, com os dados introduzidos pelo utilizador;<br/><br/>3.2. A API retorna as informações dos voos disponiveis para as datas e destino selecionado; <br/><br/>4. A informação é mostrada ao utilizador na forma de "cards".<br/><br/>4.1. O utilizador escolhe o(s) voo(s) que lhe interresa(m) e clica no butão de "book flight";<br/><br/>5. O utilizador é redirecionado para a plataforma de booking de voos indicada; <br/><br/>6. Ao regressar à plataforma, o utilizador é questionado se efetou a compra do voo ou não. Se sim, é questionado se gostaria de guardar as informações do voo na secção de "flights"; <br/><br/>7. O utilizador indica que gostaria de guardar as informações dos voos e a plataforma realiza essa ação e faz uma chamada à API do callendar da google para criar um evento para o dia do voo no calendário do utilizador. (requer prévia autorização);| 
Cenário Alternativo| 1.1. Nada acontece e o utilizador tenta novamente; <br/><br/>3.1. A API retorna erro;<br/><br/>6.1. O utilizador indica que não efetuou a comprar e é redirecionada para o pop-up de procura por voos;    |
Pós Condições|  - O utilizador tenta os passos novamente;|
Cenários Exceção|   - O utilizador sai da plataforma a qualquer momento;    |
Pós Condições|  - N\A|

#### Use Case 3 - Add friend to group
----------------------------------------------

Descrição   | Use Case destinado ao utilizador adicionar um amigo novo ou existente a um grupo |
-------------|--------------------------------------------------------------------
Pre-Condições | 1. O utilizador pussui conta na plataforma ;<br/><br/>2. O utilizador tem acesso á internet;| 
Cenário Princ.|1. O utilizador observa os grupos de viagem que tem criados;<br/><br/>1.2. O utilizador seleciona um dos grupos e a opção de adicionar um amigo;<br/><br/>1.3. Uma mensagem pop-up da lista de amigos disponiveis aparece no ecrã;<br/><br/>1.4. O utilizador seleciona um dos amigos que já tem na lista e adiciona ao grupo;<br/><br/>2.O utilizador deseja adicionar um novo amigo e seleciona essa opção;<br/><br/>3. É disponibilizado ao utilizador a opção de procurar por um utilizador já existente pelo seu e-mail;<br/><br/>3.1. O utilizador introduz um e-mail, seleciona o utilizador e adiciona como amigo;<br/><br/>3.2.O amigo não pussui conta na plataforma e o utilizador seleciona a opção de enviar um link ao amigo;<br/><br/>4. O utilizador recebe uma notificação de amigo novo e procede a repetir os passos 1 a 1.4.; | 
Cenário Alternativo| 3.3. O amigo não clica no link enviado dentro do prazo em que este se encontra ativo;  |
Pós Condições|  - O utilizador tenta os passos novamente;   |
Cenários Exceção|   - O utilizador sai da plataforma a qualquer momento;    |
Pós Condições|  - N\A|





