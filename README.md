# Sistema de Gerenciamento Acadêmico

Projeto acadêmico desenvolvido com **SQL** e **MySQL** para modelar e gerenciar informações de uma universidade, incluindo alunos, cursos, professores, matérias, matrículas, notas e frequência.

## Sobre o projeto

O banco de dados organiza os relacionamentos entre alunos, cursos e matérias. Procedimentos armazenados automatizam a matrícula de alunos, o lançamento de notas e faltas e o cálculo do resultado final — incluindo a etapa de exame quando necessário.

## Arquivos SQL

| Arquivo | Conteúdo |
| --- | --- |
| [`1.sql`](./1.sql) | Criação do banco de dados e das tabelas, com suas chaves e relacionamentos. |
| [`2.sql`](./2.sql) | Inserção de dados iniciais para cursos, professores e matérias. |
| [`3.sql`](./3.sql) | Criação do procedimento de matrícula de alunos nas matérias do curso. |
| [`4.sql`](./4.sql) | Criação do procedimento de lançamento de notas e faltas, com cálculo de média, frequência e resultado. |
| [`5.sql`](./5.sql) | Criação do procedimento de lançamento de exame e atualização do resultado final. |
| [`6.sql`](./6.sql) | Consultas para visualizar alunos, matérias e informações de matrícula. |
| [`comandos.sql`](./comandos.sql) | Exemplos de execução dos procedimentos e consultas para demonstrar o sistema. |

## Conceitos SQL utilizados

### Estrutura e relacionamentos

| Comando ou tipo | Uso |
| --- | --- |
| `CREATE DATABASE` | Cria um banco de dados. |
| `USE` | Seleciona o banco de dados que será utilizado. |
| `CREATE TABLE` | Cria uma tabela e define suas colunas e tipos de dados. |
| `PRIMARY KEY` | Identifica cada registro de forma única. |
| `FOREIGN KEY` | Estabelece relacionamentos entre tabelas. |
| `AUTO_INCREMENT` | Gera automaticamente valores sequenciais para novos registros. |
| `NOT NULL` | Impede que uma coluna receba valores nulos. |
| `INT` | Armazena números inteiros. |
| `DECIMAL` | Armazena números com casas decimais, como notas e médias. |
| `VARCHAR` | Armazena textos de tamanho variável. |
| `CHAR` | Armazena textos de tamanho fixo. |

### Manipulação e consulta de dados

| Comando ou função | Uso |
| --- | --- |
| `INSERT INTO` | Insere novos registros em uma tabela. |
| `VALUES` | Define os valores que serão inseridos. |
| `SELECT` | Consulta informações armazenadas nas tabelas. |
| `FROM` | Indica de qual tabela vêm as informações consultadas. |
| `WHERE` | Define condições para filtrar registros em consultas ou atualizações. |
| `INNER JOIN` | Relaciona informações de tabelas diferentes por meio de colunas correspondentes. |
| `ON` | Define a condição de relacionamento em uma operação `JOIN`. |
| `AS` | Cria um apelido temporário para uma tabela ou coluna. |
| `UPDATE` | Atualiza informações existentes em uma tabela. |
| `SET` | Define os valores atribuídos a colunas ou variáveis. |
| `ORDER BY` | Ordena os resultados de uma consulta. |
| `GROUP BY` | Agrupa registros que têm valores iguais em determinada coluna. |
| `COUNT()` | Conta registros em uma tabela ou grupo. |
| `COALESCE()` | Retorna o primeiro valor não nulo de uma lista; neste projeto, considera notas e faltas não preenchidas como zero. |

### Procedimentos armazenados

| Comando ou função | Uso |
| --- | --- |
| `CREATE PROCEDURE` | Cria um procedimento armazenado com um conjunto de comandos SQL. |
| `DROP PROCEDURE IF EXISTS` | Exclui um procedimento, caso exista, antes de criá-lo novamente. |
| `CALL` | Executa um procedimento armazenado. |
| `DECLARE` | Declara variáveis dentro de um procedimento. |
| `IN` | Define um parâmetro de entrada de um procedimento. |
| `DELIMITER` | Altera temporariamente o delimitador de comandos durante a criação de procedimentos. |
| `BEGIN` / `END` | Delimitam um bloco de comandos. |
| `IF` / `ELSEIF` / `ELSE` | Permitem executar comandos diferentes de acordo com condições. |
| `LAST_INSERT_ID()` | Recupera o último identificador gerado por uma coluna `AUTO_INCREMENT`. |
| `INTO` | Armazena o resultado de uma consulta `SELECT` em variáveis. |
| `SIGNAL SQLSTATE` | Gera um erro personalizado durante a execução de um procedimento. |
