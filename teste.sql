

USE TESTE


CREATE TABLE PRODUTOS (
	CODIGO INT NOT NULL IDENTITY(1,1),
	DESCRICAO VARCHAR(50) NOT NULL,
	UM VARCHAR (20) NOT NULL
)


INSERT INTO PRODUTOS VALUES 
('PROD 1',' UN'),
('PROD 2',' KG'),
('PROD 3',' LT')

SELECT * FROM PRODUTOS