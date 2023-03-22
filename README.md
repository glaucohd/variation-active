# INSTRUÇÃO


O desafio do projeto é:

1-Implementar o core da aplicação a talea inicial em linguagem nativa Swift.

2 -Consultar o preço do ativo na API do Yahoo Finance (este é um exemplo da consulta do ativo PETR4 https://query2.finance.yahoo.com/v8/finance/chart/PETR4.SA)

3-Implementar uma tela em flutter que apresente a variação do preço do ativo nos últimos 30 pregões e mostre a rentabilidade no período. Você deverá considerar o valor de abertura (chart.result.indicators.quote.open)

4-Inclua um gráfico em linguagem nativa ou flutter apresentando o resultado da variação.


Para executar o projeto, abra a pasta VariationStockChallenge(pode ser pelo terminal tbm) e rode o comando pod install

Depois da execução do pod install, é necessario abrir o projeto através do arquivo VariationStockChallenge.xcworkspace
o xcode será aberto, e basta executar o projeto normalmente.

Projeto desenvolvido utilizando os padrões de clean arquitetura, SOLID e TDD.

# No aplicativo, utilizei as seguintes libs:

- provider: Utilizei para gerenciamento de estado
- http: Utilizei para conexão com serviço
- chart_sparkline: Utilizei para gerar os graficos
- mockito: para os testes unitários







