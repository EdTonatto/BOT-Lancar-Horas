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

* pip install selenium
* pip install cx_freeze (para gerar .exe)
