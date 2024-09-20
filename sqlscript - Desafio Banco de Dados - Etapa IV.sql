/*criação das tabelas*/  

CREATE TABLE Publicacao ( 

    ISSN NUMBER PRIMARY KEY, 
    TituloP VARCHAR2(255), 
    Editora VARCHAR2(255), 
    URL VARCHAR2(255) 

); 

CREATE TABLE Area ( 

    AreaID VARCHAR2(255) PRIMARY KEY, 
    DescricaoA VARCHAR2(255) 

); 
  
CREATE TABLE Artigos ( 

    ArtigoID NUMBER PRIMARY KEY, 
    TituloA VARCHAR2(255), 
    ISSN NUMBER, 
    Ano NUMBER, 
    NumeroPaginas NUMBER, 
    AreaID VARCHAR2(255), 
    FOREIGN KEY (ISSN) REFERENCES Publicacao(ISSN), 
    CONSTRAINT fk_areaid_Area FOREIGN KEY (AreaID) REFERENCES Area(AreaID) 

);   

CREATE TABLE PalavraChave ( 

    PC VARCHAR2(255) PRIMARY KEY, 
    DescricaoPC VARCHAR2(255) 

);   

CREATE TABLE Publicado ( 

    ArtigoID NUMBER, 
    ISSN NUMBER, 
    PRIMARY KEY (ArtigoID, ISSN), 
    CONSTRAINT fk_artigos_ArtigoID FOREIGN KEY (ArtigoID) REFERENCES Artigos(ArtigoID), 
    CONSTRAINT fk_publicacao_ISSN FOREIGN KEY (ISSN) REFERENCES Publicacao(ISSN) 

);   

CREATE TABLE ArtigoPC ( 

    ArtigoID NUMBER, 
    PC VARCHAR2(255), 
    PRIMARY KEY (ArtigoID, PC), 
    FOREIGN KEY (ArtigoID) REFERENCES Artigos(ArtigoID), 
    CONSTRAINT  fk_palavrachave_PC FOREIGN KEY (PC) REFERENCES PalavraChave(PC) 

); 
 

/*5 inserções em cada tabela*/ 
 
--tabela Publicacao 

INSERT INTO Publicacao (ISSN, TituloP, Editora, URL) 

VALUES (24480959, 'Ciência de Dados: Big Data e Gestão dos Dados', 'Revista Científica Multidisciplinar Núcleo do Conhecimento', 'https://www.nucleodoconhecimento.com.br/tecnologia/gestao-dos-dados');   

INSERT INTO Publicacao (ISSN, TituloP, Editora, URL) 

VALUES (26751828, 'Inteligência artificial e suas dependências na vida humana', 'Revista Brasileira em Tecnologia da Informação', 'https://www.fateccampinas.com.br/rbti/index.php/fatec/article/view/106');   

INSERT INTO Publicacao (ISSN, TituloP, Editora, URL) 

VALUES (26756218, 'Inteligência Artifical: Machine Learning na Gestão Empresarial', 'Revista Brasileira em Tecnologia da Informação', 'https://recima21.com.br/index.php/recima21/article/view/1617');   

INSERT INTO Publicacao (ISSN, TituloP, Editora, URL) 

VALUES (15188353, 'Banco de dados de acesso público', 'Ciência da informação', 'https://revista.ibict.br/ciinf/article/view/271');  

INSERT INTO Publicacao (ISSN, TituloP, Editora, URL) 

VALUES (23583908, 'Big Data: os novos desafios para o profissional da informação', 'Associação Nacional de Pesquisa e Pós-Graduação em Ciência da Informação', 'https://periodicos.ufpb.br/index.php/itec/article/view/19380');  

-- tabela Area

INSERT INTO Area (AreaID, DescricaoA) 

VALUES ('CD', ' Ciência de Dados');   

INSERT INTO Area (AreaID, DescricaoA) 

VALUES ('IA', 'Inteligência Artificial');   

INSERT INTO Area (AreaID, DescricaoA) 

VALUES ('ML', 'Machine Learning');   

INSERT INTO Area (AreaID, DescricaoA) 

VALUES ('DB', 'Banco de dados');   

INSERT INTO Area (AreaID, DescricaoA) 

VALUES ('BD', 'Big Data'); 

-- tabela Artigos

INSERT INTO Artigos (ArtigoID, TituloA, ISSN, Ano, NumeroPaginas, AreaID) 

VALUES (1, 'Ciência de Dados: Big Data e Gestão dos Dados', 24480959, 2020, 6, 'CD');   

INSERT INTO Artigos (ArtigoID, TituloA, ISSN, Ano, NumeroPaginas, AreaID) 

VALUES (2, 'Inteligência artificial e suas dependências na vida humana', 26751828, 2024, 12, 'IA'); 

INSERT INTO Artigos (ArtigoID, TituloA, ISSN, Ano, NumeroPaginas, AreaID) 

VALUES (3, 'Inteligência Artifical: Machine Learning na Gestão Empresarial', 26756218, 2022, 16, 'ML'); 

INSERT INTO Artigos (ArtigoID, TituloA, ISSN, Ano, NumeroPaginas, AreaID) 

VALUES (4, 'Banco de dados de acesso público', 15188353, 1987, 8, 'DB');   

INSERT INTO Artigos (ArtigoID, TituloA, ISSN, Ano, NumeroPaginas, AreaID) 

VALUES (5, 'Big Data: os novos desafios para o profissional da informação', 23583908, 2014, 22, 'BD');  

--tabela PalavraChave

INSERT INTO PalavraChave (PC, DescricaoPC) 

VALUES ('DataScience', 'Ciência das análises de dados');   

INSERT INTO PalavraChave (PC, DescricaoPC) 

VALUES ('Artificial Intelligence', 'Algoritmos extensos para automatizações');   

INSERT INTO PalavraChave (PC, DescricaoPC) 

VALUES ('Aprendizado de Máquina', 'Redes neurais e relação humano computador');   

INSERT INTO PalavraChave (PC, DescricaoPC) 

VALUES ('Banco de Dados', 'Dados relacionais e modelagens');   

INSERT INTO PalavraChave (PC, DescricaoPC) 

VALUES ('Big Data', 'Fenômeno do grande volume de dados');  

-- tabela Publicado (N:N)

INSERT INTO Publicado (ArtigoID, ISSN) 

VALUES (1, 24480959);   

INSERT INTO Publicado (ArtigoID, ISSN) 

VALUES (2, 26756218);   

INSERT INTO Publicado (ArtigoID, ISSN) 

VALUES (3, 26756218);   

INSERT INTO Publicado (ArtigoID, ISSN) 

VALUES (4, 15188353);   

INSERT INTO Publicado (ArtigoID, ISSN) 

VALUES (5, 23583908);  

-- tabela ArtigoPC (N:N)

INSERT INTO ArtigoPC (ArtigoID, PC) 

VALUES (1, 'DataScience');   

INSERT INTO ArtigoPC (ArtigoID, PC) 

VALUES (2, 'Artificial Intelligence');   

INSERT INTO ArtigoPC (ArtigoID, PC) 

VALUES (3, 'Aprendizado de Máquina');   

INSERT INTO ArtigoPC (ArtigoID, PC) 

VALUES (4, 'Banco de Dados');   

INSERT INTO ArtigoPC (ArtigoID, PC) 

VALUES (5, 'Big Data'); 
