# Projeto Lógico Mecânica

## Objetivos

Este projeto faz parte de um bootcamp e tem como objetivo a criação de um modelo lógico para uma oficina mecânica, incluindo a elaboração de scripts e consultas para responder a diversas perguntas e gerar informações relevantes.

## Requisitos para Criação de Consultas

As consultas devem abranger os seguintes aspectos:

- **Recuperações Simples**: Utilização do comando `SELECT` para obter dados básicos.
- **Filtros Específicos**: Aplicação de condições com `WHERE` para refinar os resultados.
- **Atributos Derivados**: Criação de expressões que gerem novos atributos baseados nos existentes.
- **Ordenação de Dados**: Organização dos resultados utilizando `ORDER BY`.
- **Filtros em Grupos**: Uso de `HAVING` para aplicar condições após a agregação de dados.
- **Junções entre Tabelas**: Combinação de dados de múltiplas tabelas para obter perspectivas mais complexas.

## Diretrizes

- Não há um número mínimo de consultas a serem realizadas.
- Os tópicos supracitados devem estar presentes nas queries.
- Elabore perguntas que possam ser respondidas pelas consultas desenvolvidas.
- As cláusulas podem estar presentes em mais de uma consulta.

## Perguntas Para Desenvolvimento de Consultas

1. Quais são os nomes completos e CPFs dos clientes cadastrados na oficina?
2. Qual a idade de cada cliente?
3. Qual a quantidade de clientes que tem idade maior que 40 anos?
4. Existe alguma equipe sem mecânico?
5. Qual o tipo de Serviço foi realizado mais de 1 vez?
6. Qual a equipe que elaborou a ordem de servico mais cara?
7. Quais peças foram utilizadas em cada ordem de serviço, sua qunatidade e seus valores totais?
8. Qual o valor da mão de obra dos serviços, do mais barato ao mais caro?

## Estrutura do Projeto

O projeto está organizado da seguinte forma:

- `projeto-fisico-mecanica.sql`: Contém o script de criação do banco de dados e seu esquema.
- `seed-tabelas-mecanica.sql`: Script para inserção de dados fictícios no banco de dados.
- `querys-teste.sql`: Inclui as consultas que respondem às perguntas listadas anteriormente.

## Como Utilizar

1. **Configuração do Banco de Dados**: Execute o script `projeto-fisico-mecanica.sql` em seu SGBD para criar o esquema do banco de dados.
2. **Inserção de Dados**: Após a criação do esquema, execute o script `seed-tabelas-mecanica.sql` para popular o banco com dados de exemplo.
3. **Execução das Consultas**: Utilize o script `querys-teste.sql` para executar as consultas e verificar as respostas para as perguntas propostas.

## Tecnologias
- MySQL 8

