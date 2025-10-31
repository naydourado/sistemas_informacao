-- 1. Criar banco de dados
CREATE DATABASE IF NOT EXISTS streaming;
USE streaming;

-- 2. Criar tabelas

-- Tabela de atores
CREATE TABLE Ator (
    ator_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50),
    ano_nascimento INT
);

-- Tabela de filmes
CREATE TABLE Filme (
    filme_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_lancamento INT,
    genero VARCHAR(50),
    duracao_min INT
);

-- Tabela de associação (muitos-para-muitos)
CREATE TABLE Filme_Ator (
    filme_id INT,
    ator_id INT,
    papel VARCHAR(100),
    PRIMARY KEY (filme_id, ator_id),
    FOREIGN KEY (filme_id) REFERENCES Filme(filme_id) ON DELETE CASCADE,
    FOREIGN KEY (ator_id) REFERENCES Ator(ator_id) ON DELETE CASCADE
);

-- ===============================================
-- 3. Inserir dados fictícios
-- ===============================================

-- Atores
INSERT INTO Ator (nome, nacionalidade, ano_nascimento) VALUES
('Robert Downey Jr.', 'Estados Unidos', 1965),
('Scarlett Johansson', 'Estados Unidos', 1984),
('Chris Hemsworth', 'Austrália', 1983),
('Tom Holland', 'Reino Unido', 1996),
('Zendaya', 'Estados Unidos', 1996),
('Keanu Reeves', 'Canadá', 1964),
('Leonardo DiCaprio', 'Estados Unidos', 1974),
('Emma Stone', 'Estados Unidos', 1988),
('Ryan Gosling', 'Canadá', 1980),
('Margot Robbie', 'Austrália', 1990);

-- Filmes
INSERT INTO Filme (titulo, ano_lancamento, genero, duracao_min) VALUES
('Homem de Ferro', 2008, 'Ação', 126),
('Os Vingadores', 2012, 'Ação', 143),
('Homem-Aranha: Sem Volta para Casa', 2021, 'Ação', 148),
('John Wick', 2014, 'Ação', 101),
('Matrix', 1999, 'Ficção Científica', 136),
('A Origem', 2010, 'Ficção Científica', 148),
('La La Land', 2016, 'Musical', 128),
('Barbie', 2023, 'Comédia', 114),
('Ad Astra', 2019, 'Drama', 123),
('Doutor Estranho', 2016, 'Aventura', 115);

-- Relacionamento Filme x Ator
INSERT INTO Filme_Ator (filme_id, ator_id, papel) VALUES
(1, 1, 'Tony Stark / Homem de Ferro'),
(2, 1, 'Tony Stark / Homem de Ferro'),
(2, 2, 'Natasha Romanoff / Viúva Negra'),
(2, 3, 'Thor'),
(3, 4, 'Peter Parker / Homem-Aranha'),
(3, 5, 'MJ'),
(4, 6, 'John Wick'),
(5, 6, 'Neo'),
(6, 7, 'Dom Cobb'),
(7, 8, 'Mia'),
(7, 9, 'Sebastian'),
(8, 10, 'Barbie');

-- ===============================================
-- 4. Operações CRUD
-- ===============================================

-- --- CREATE ---
-- Inserir um novo ator
INSERT INTO Ator (nome, nacionalidade, ano_nascimento)
VALUES ('Benedict Cumberbatch', 'Reino Unido', 1976);

-- Inserir um novo filme
INSERT INTO Filme (titulo, ano_lancamento, genero, duracao_min)
VALUES ('Doutor Estranho no Multiverso da Loucura', 2022, 'Aventura', 126);

-- Relacionar novo filme com o ator
INSERT INTO Filme_Ator (filme_id, ator_id, papel)
VALUES (11, 11, 'Stephen Strange / Doutor Estranho');

-- --- READ ---
-- 1. Listar todos os filmes com seus atores
SELECT F.titulo AS Filme, A.nome AS Ator, FA.papel AS Papel
FROM Filme F
JOIN Filme_Ator FA ON F.filme_id = FA.filme_id
JOIN Ator A ON FA.ator_id = A.ator_id
ORDER BY F.titulo;

-- 2. Buscar todos os filmes de um ator específico
SELECT F.titulo, F.ano_lancamento
FROM Filme F
JOIN Filme_Ator FA ON F.filme_id = FA.filme_id
JOIN Ator A ON FA.ator_id = A.ator_id
WHERE A.nome = 'Keanu Reeves';

-- 3. Contar quantos filmes cada ator participou
SELECT A.nome AS Ator, COUNT(FA.filme_id) AS Quantidade_Filmes
FROM Ator A
LEFT JOIN Filme_Ator FA ON A.ator_id = FA.ator_id
GROUP BY A.nome
ORDER BY Quantidade_Filmes DESC;

-- --- UPDATE ---
-- Atualizar o gênero de um filme
UPDATE Filme
SET genero = 'Ação e Aventura'
WHERE titulo = 'Homem-Aranha: Sem Volta para Casa';

-- Atualizar nacionalidade de um ator
UPDATE Ator
SET nacionalidade = 'EUA / Reino Unido'
WHERE nome = 'Tom Holland';

-- --- DELETE ---
-- Remover um ator e seus relacionamentos
DELETE FROM Ator
WHERE nome = 'Leonardo DiCaprio';

-- Remover um filme específico
DELETE FROM Filme
WHERE titulo = 'Ad Astra';

-- ===============================================
-- Fim do Script
-- ===============================================