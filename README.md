# BOT-Lancar-Horas

Bot desenvolvido para lançar no Redmine ESM as horas referentes às atividades realizadas, de forma automática, a partir de um arquivo CSV.
O Arquivo CSV tem o nome de **BOT-Horas-para-lancar** e contém as seguintes colunas:
1. **Projeto** (Sprints, Aplicativos... Exemplo: Sprint 011 ou Mobile Viagens)
1. **Tarefa** (Tarefa relacionada com a atividade)
1. **Dia** (Dia em que a atividade foi realizada)
1. **Tempo Gasto** (Tempo que foi gasto com a atividade)
1. **Descrição** (Descrição referente ao que foi realizado na atividade)
1. **Atividade** (Tipo da atividade que foi realizada, exemplo: Atividade, Teste, Desenvolvimento...)

---

Dependencias (falta terminar de descrever exatamente para que cada coisa serve):

1. [Selenium](https://selenium.dev/):
   - Para instalar basta rodar o comando `pip install selenium` no terminal.
   - É através do Selenium que é possível controlar um navegador (neste caso, Chrome) utilizando Python, está sendo utilizado no momento para:
     - Iniciar uma nova janela do navegador.
     - Mapear campos que estão aparecendo no site.
     - Enviar dados (I/O) para preencher campos.
     - Clique em botões mapeados.
   - Para visualizar a página da biblioteca no PyPI clique [aqui](https://pypi.org/project/selenium/).
   - Para visualizar a documentação do Selenium basta clicar [aqui](https://selenium.dev/documentation/en/).
1. [cx_Freeze](https://anthony-tuininga.github.io/cx_Freeze/):
   - Para instalar basta rodar o comando `pip install cx_Freeze` no terminal.
   - O cx_Freeze é utilizado para "congelar" os códigos em Python, para isso é utilziado o arquivo [setup.py](./instalador/Pasta%20Compilador/setup.py) que contem configurações a respeito do executável que será gerado, bem como:
     - Caminho para qual arquivo se tornará um executável.
     - Ícone que será atribuido ao executável.
     - Dependencias de bibliotecas que devem ser anexadas à pasta lib junto ao executável.
     - Configurações de nome, descrição e versionamento.
   - Para gerar o executável é necessário executar o [setup.py](./instalador/Pasta%20Compilador/setup.py) da seguinte maneira: `python setup.py build`.
   - Para visualizar a documentação do cx_Freeze basta clicar [aqui](https://cx-freeze.readthedocs.io/en/latest/index.html).
1. Inno Setup (pra gerar instalador) **NECESSÁRIO COMPLEMENTAR INFORMAÇOES**

