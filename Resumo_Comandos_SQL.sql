/********** SELECT **********
/********** Selecionar colunas das tabelas **********/

-- Selecionar colunas específicas

SELECT coluna1, coluna2
FROM tabela

-- Selecionar todas as colunas
SELECT *
FROM tabela

-- Práticas

SELECT FirstName, LastName
FROM person.Person;

SELECT *
FROM person.Person;

SELECT Title
FROM person.Person;

SELECT *
FROM person.EmailAddress;

/********** DISTINCT **********/
/********** Selecionar valores sem duplicidade **********/

SELECT DISTINCT FirstName
FROM person.Person;

SELECT DISTINCT LastName
FROM person.Person;

/********** WHERE **********/
/********** Selecionar dados específicos da tabela **********/

/* 

SELECT coluna
FROM tabela
WHERE condicao

Na condição do WHERE vamos trabalhar com operadores lógicos:
= 
>
<
>=
<=
<>
AND
OR

*/

SELECT *
FROM person.Person
WHERE LastName = 'miller'

SELECT *
FROM person.Person
WHERE LastName = 'miller' and FirstName = 'anna'

SELECT *
FROM Production.Product
WHERE Color = 'blue' OR Color = 'red'

SELECT *
FROM Production.Product
WHERE ListPrice > 1500

SELECT *
FROM Production.Product
WHERE ListPrice > 1500 and ListPrice < 5000.5

SELECT *
FROM Production.Product
WHERE Color <> 'black'

SELECT *
FROM Production.Product
WHERE Weight > 500 and Weight < 700

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus ='M' and SalariedFlag = 1

SELECT *
FROM person.Person
WHERE FirstName = 'Peter' and LastName = 'Krebs'
    SELECT *
    FROM person.EmailAddress
    WHERE BusinessEntityID = 26

/********** COUNT **********/
/********** Retorna o número de linhas da condição enviada **********/

SELECT COUNT(*)
FROM person.Person

SELECT COUNT(DISTINCT title)
FROM person.Person

-- Quantos produtos temos cadastrados na tabela de produtos? (production.product)

SELECT COUNT(*)
FROM Production.Product

-- Quatos tamanhos de produtos temos cadastrados em nossa tabela? (production.product)

SELECT COUNT(DISTINCT Size)
FROM Production.Product

/********** TOP **********/
/********** Filtrar e limitar a quantidade retornada de um select **********/

SELECT TOP 10 *
FROM Production.Product

/********** ORDER BY **********/
/********** Ordernar os resultados da coluna por ordem crescente/decrescente**********/

/* 
SELECT coluna
FROM tabela
ORDER BY coluna asc/desc 
*/

SELECT *
FROM person.Person
ORDER BY FirstName asc

SELECT FirstName, LastName
FROM person.Person
ORDER BY FirstName asc, LastName desc

-- Quais são os 10 produtos mais caros cadastrados no sistema? Listando do mais caro para o mais barato

SELECT TOP (10) Name, ProductID
FROM Production.Product
ORDER BY ListPrice desc

/********** BETWEEN **********/
/********** Encontrar um valor entre um valor mínimo e um valor máximo **********/

SELECT *
FROM Production.Product
WHERE ListPrice BETWEEN 1000 and 1500;

SELECT *
FROM Production.Product
WHERE ListPrice NOT BETWEEN 1000 and 1500;

SELECT *
FROM HumanResources.Employee
WHERE HireDate BETWEEN '2009/01/01' AND '2010/01/01'
ORDER BY HireDate

/********** IN **********/
/********** Usado junto com o WHERE para verificar se um valor corresponde com qualquer valor passado na lista de valores **********/

/*

Pode ser usado de duas formas: 

valor IN (valor1, valor2)
valor IN (SELECT valor FROM nomeDaTabela)

*/

SELECT *
FROM person.Person
WHERE LastName IN ('Adams', 'Randall')
ORDER BY LastName

/********** LIKE **********/
/********** Usado para encontrar valores aos quais temos poucas informações **********/

-- No começo
SELECT *
FROM person.Person
WHERE FirstName LIKE 'wi%'

-- No final
SELECT *
FROM person.Person
WHERE FirstName LIKE '%to'

-- No meio

SELECT *
FROM person.Person
WHERE FirstName LIKE '%essa%'

/********** EXERCÍCIOS **********/

-- Quantos produtos temos cadastrados no sistema que custam mais de 1500 dolares?

SELECT COUNT(*)
FROM Production.Product
WHERE ListPrice > 1500

-- Quantas pessoas temos com o sobrenome que inicia com a letra 'P'?

SELECT COUNT(*)
FROM person.Person
WHERE LastName LIKE 'p%'

-- Em quantas cidades únicas estão cadastrados nossos clientes?

SELECT COUNT(DISTINCT City)
FROM Person.Address

-- Quais são as cidades únicas que temos cadastradas em nosso sistema?

SELECT DISTINCT City
FROM Person.Address
ORDER BY City

-- Quantos produtos vermelhos tem preço entre 500 a 1000 dolares?

SELECT COUNT(*)
FROM Production.Product
WHERE Color IN('Red') AND ListPrice BETWEEN 500 AND 1000

-- Quantos produtos cadastrados tem a palavra 'road' no nome deles?

SELECT COUNT(*)
FROM Production.Product
WHERE name LIKE '%road%'