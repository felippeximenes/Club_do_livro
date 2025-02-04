ALTER TABLE ESTOQUE ADD CONSTRAINT CE_ESTOQUE_LIVROS
FOREIGN KEY (ID_LIVRO)
REFERENCES LIVROS (ID_LIVRO)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


ALTER TABLE LIVROS 
ADD ESTOQUE INT NOT NULL;

CREATE TABLE LIVROS (
    ID_LIVRO INT NOT NULL,
    NOME_LIVRO VARCHAR(100) NOT NULL,
    AUTORIA VARCHAR(100) NOT NULL,
    EDITORA VARCHAR(100) NOT NULL,
    CATEGORA VARCHAR(100) NOT NULL,
    PREÇO DECIMAL(5,2) NOT NULL,
    
    PRIMARY KEY (ID_LIVRO)
);

CREATE TABLE ESTOQUE (
    ID_LIVRO INT NOT NULL,
    QTD_ESTOQUE INT NOT NULL,
	PRIMARY KEY (ID_LIVRO)
);

CREATE TABLE VENDAS (
    ID_PEDIDO INT NOT NULL,
    ID_VENDEDOR INT NOT NULL,
    ID_LIVRO INT NOT NULL,
    QTD_VENDIDA INT NOT NULL,
    DATA_VENDA DATE NOT NULL,
	PRIMARY KEY (ID_VENDEDOR,ID_PEDIDO)
);

CREATE TABLE VENDEDORES (
    ID_VENDEDOR INT NOT NULL,
    NOME_VENDEDOR VARCHAR(255) NOT NULL,
	PRIMARY KEY (ID_VENDEDOR)
);

SET FOREIGN_KEY_CHECKS =0;

DROP TABLE estoque;
DROP TABLE vendas;
DROP TABLE vendedores;

INSERT INTO LIVROs VALUES (
1,
"Percy Jackson e o Ladrao de Raios",
"Rick Riordan",
"Intrinseca",
"Aventura",
34.65);

INSERT INTO LIVROS VALUES
(2, 'A volta ao mundo em 80 dias', 'Julio Verne', 'Principis', ' Aventura', 21.99),
(3, 'O Cortiço', 'Aluiso de Azevedo', 'Panda Books', 'Romance', 47.8),
(4, 'Dom Casmurro', 'Machado de Assis', 'Via Leitrura', ' Romance', 48);

INSERT INTO LIVROS VALUES
(5,'Memórias Póstumas de Brás Cubas','Machado de Assis','Antofágica','Romance',    45),
(6,'Quincas Borba',   'Machado de Assis','L&PM Editores', 'Romance',48.5),
(7,'Ícaro',  'Gabriel Pedrosa',     'Ateliê','Poesia',36),
(8,'Os Lusíadas','Luís Vaz de Camões',  'Montecristo','Poesia',18.79),
(9,'Outros Jeitos de Usar a Boca','Rupi Kaur','Planeta','Poesia',34.8);

INSERT INTO VENDEDORES 
VALUES
(1,'Paula Rabelo'),
(2,'Juliana Macedo'),
(3,'Roberto Barros'),
(4,'Barbara Jales');

INSERT INTO VENDAS 
VALUES 
(1, 3, 7, 1, '2020-11-02'),
(2, 4, 8, 2, '2020-11-02'),
(3, 4, 4, 3, '2020-11-02'),
(4, 1, 7, 1, '2020-11-03'),
(5, 1, 6, 3, '2020-11-03'),
(6, 1, 9, 2, '2020-11-04'),
(7, 4, 1, 3, '2020-11-04'),
(8, 1, 5, 2, '2020-11-05'),
(9, 1, 2, 1, '2020-11-05'),
(10, 3, 8, 2, '2020-11-11'),
(11, 1, 1, 4, '2020-11-11'),
(12, 2, 10, 10, '2020-11-11'),
(13, 1, 12, 5, '2020-11-18'),
(14, 2, 4, 1, '2020-11-25'),
(15, 3, 13, 2,'2021-01-05'),
(16, 4, 13, 1, '2021-01-05'),
(17, 4, 4, 3, '2021-01-06'),
(18, 2, 12, 2, '2021-01-06');

INSERT INTO ESTOQUE 
VALUES
(1,  7),
(2,  10),
(3,  2),
(8,  4),
(10, 5),
(11, 3),
(12, 3);


ALTER TABLE LIVROS 
CHANGE CATEGORA CATEGORIA VARCHAR(100);

SELECT * FROM LIVROS
WHERE CATEGORIA = "POESIA" AND NOT (AUTORIA = "Luís Vaz de Camões" OR AUTORIA = "GABRIEL PEDROSA");


#Obtendo linsta unica e seleção por ordem
SELECT DISTINCT ID_LIVRO FROM VENDAS
WHERE ID_VENDEDOR = 1
ORDER BY ID_LIVRO;

#Excluindo o registro de uma tabela
SELECT * FROM LIVROS;
DELETE FROM LIVROS WHERE ID_LIVRO = 8;

#Alterando os preços de uma tabela
UPDATE LIVROS SET PREÇO = 0.9*PREÇO;

#Deletando um livro que não será mais vendido
DELETE FROM LIVROS 
WHERE ID_LIVRO = 8;

#Reajuste do preço do livro
UPDATE LIVROS SET PREÇO = 0.9 * PREÇO;

#Consulta para unir campos de tabela
SELECT VENDAS.ID_VENDEDOR, VENDEDORES.NOME_VENDEDOR, SUM(VENDAS.QTD_VENDIDA)
FROM VENDAS, VENDEDORES
WHERE VENDAS.ID_VENDEDOR = VENDEDORES.ID_VENDEDOR
GROUP BY VENDAS.ID_VENDEDOR;

#Juntando tabelas com informações de modo diferentes
SELECT VENDAS.ID_VENDEDOR, VENDEDORES.NOME_VENDEDOR, SUM(VENDAS.QTD_VENDIDA)
FROM VENDAS INNER JOIN VENDEDORES
ON VENDAS.ID_VENDEDOR = VENDEDORES.ID_VENDEDOR
GROUP BY VENDAS.ID_VENDEDOR;

#Identificando a quantidade de livros vendidos
SELECT LIVROS.NOME_LIVRO, VENDAS.QTD_VENDIDA
FROM LIVROS, VENDAS
WHERE VENDAS.ID_LIVRO = LIVROS.ID_LIVRO;

#Para saber a maior venda feita
SELECT MAX(QTD_VENDIDA) FROM VENDAS;

#Para saber se todos os livros da tabela de dados foram vendidos
SELECT LIVROS.NOME_LIVRO,
		VENDAS.QTD_VENDIDA
FROM LIVROS LEFT JOIN VENDAS
ON LIVROS.ID_LIVRO = VENDAS.ID_LIVRO
WHERE VENDAS.QTD_VENDIDA IS NULL;

#Verificando na base de dados itens que foi perdido ou exlcuido
SELECT VENDAS.ID_LIVRO,
		LIVROS.NOME_LIVRO,
		VENDAS.QTD_VENDIDA
FROM LIVROS RIGHT JOIN VENDAS
ON LIVROS.ID_LIVRO = VENDAS.ID_LIVRO;









