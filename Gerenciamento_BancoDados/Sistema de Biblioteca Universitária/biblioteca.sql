-- ===============================================
-- Script: biblioteca.sql
-- ===============================================

-- ===============================================
-- PASSO 1 - Criar o banco de dados
-- ===============================================
-- ===============================================
Caso a tabela tenha sido criada, iniciar o código apagando e criando novamente depois
DROP DATABASE IF EXISTS biblioteca;-- ===============================================

CREATE DATABASE biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE biblioteca;

-- ===============================================
-- PASSO 2 - Criar tabelas
-- Observações:
--  - chaves primárias: id autoincrement
--  - unicidade: student.email, category.name
--  - chaves estrangeiras com ON DELETE CASCADE em book (autor/categoria) e loan (book/student)
-- ===============================================

-- Tabela de autores
CREATE TABLE author (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL
);

-- Tabela de categorias
CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de livros
CREATE TABLE book (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(250) NOT NULL,
    year_publication INT,
    author_id INT NOT NULL,
    category_id INT NOT NULL,
    -- foreign keys
    CONSTRAINT fk_book_author FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE,
    CONSTRAINT fk_book_category FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE CASCADE
);

-- Tabela de alunos
CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE
);

-- Tabela de empréstimos (junction N:M entre book e student)
CREATE TABLE loan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    student_id INT NOT NULL,
    date_withdrawal DATE NOT NULL,        -- data de retirada
    date_expected DATE NOT NULL,          -- data de devolução prevista
    date_returned DATE DEFAULT NULL,      -- data de devolução real (NULL se não devolvido ainda)
    CONSTRAINT fk_loan_book FOREIGN KEY (book_id) REFERENCES book(id) ON DELETE CASCADE,
    CONSTRAINT fk_loan_student FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE
);

-- Índices para acelerar consultas (opcional mas recomendável)
CREATE INDEX idx_book_author ON book(author_id);
CREATE INDEX idx_book_category ON book(category_id);
CREATE INDEX idx_loan_book ON loan(book_id);
CREATE INDEX idx_loan_student ON loan(student_id);

-- ===============================================
-- PASSO 3 - Inserir dados fictícios
--  - 10 autores
--  - 5 categorias
--  - 30 livros (cada livro associado a autor e categoria)
--  - 30 alunos
--  - 20 empréstimos
-- ===============================================

-- 3.1 Autores (10)
INSERT INTO author (name) VALUES
('Machado de Assis'),
('J. K. Rowling'),
('George Orwell'),
('Clarice Lispector'),
('Jane Austen'),
('Isaac Asimov'),
('Augusto Cury'),
('Chimamanda Ngozi Adichie'),
('Gabriel García Márquez'),
('Fiódor Dostoiévski');

-- 3.2 Categorias (5)
INSERT INTO category (name) VALUES
('Romance'),
('Fantasia'),
('Distopia'),
('Ciências'),
('Clássico');

-- 3.3 Livros (30) - cada um com author_id e category_id
-- Observação: author_id refere-se à ordem de inserção dos autores acima (1..10)
-- category_id refere-se à ordem de inserção das categorias (1..5)

INSERT INTO book (title, year_publication, author_id, category_id) VALUES
('Dom Casmurro', 1899, 1, 5),
('Memórias Póstumas de Brás Cubas', 1881, 1, 5),
('Harry Potter e a Pedra Filosofal', 1997, 2, 2),
('Harry Potter e a Câmara Secreta', 1998, 2, 2),
('1984', 1949, 3, 3),
('A Revolução dos Bichos', 1945, 3, 3),
('A Paixão Segundo G.H.', 1964, 4, 5),
('Orgulho e Preconceito', 1813, 5, 5),
('Fundação', 1951, 6, 4),
('Eu, Robô', 1950, 6, 4),
('Ansiedade: Como Enfrentar', 2000, 7, 4),
('O Sol e Seus Flores', 2017, 8, 1),
('Cem Anos de Solidão', 1967, 9, 1),
('Crimes e Castigos', 1866, 10, 5),
('O Alienista', 1882, 1, 5),
('Harry Potter e o Prisioneiro de Azkaban', 1999, 2, 2),
('Admirável Mundo Novo', 1932, 3, 3),
('Sobre a Escrita Feminina', 2010, 8, 1),
('O Amor Nos Tempos do Cólera', 1985, 9, 1),
('Os Irmãos Karamazov', 1880, 10, 5),
('Psicologia Para Leigos', 2012, 7, 4),
('O Livro das Emotions', 2015, 7, 4),
('Harry Potter e o Cálice de Fogo', 2000, 2, 2),
('Romance Moderno (exemplo)', 2018, 9, 1),
('Contos de Amor e Fantasia', 2020, 8, 2),
('Ficções Científicas Variadas', 2021, 6, 4),
('Ensaios Sobre Literatura', 2019, 5, 5),
('Pequenos Contos', 2011, 4, 1),
('Manual de Programação (exemplo)', 2022, 6, 4),
('Distopias Contemporâneas', 2016, 3, 3);

-- 3.4 Alunos (30)
INSERT INTO student (name, email) VALUES
('Ana Silva', 'ana.silva@university.edu'),
('Bruno Souza', 'bruno.souza@university.edu'),
('Carla Pereira', 'carla.pereira@university.edu'),
('Daniel Oliveira', 'daniel.oliveira@university.edu'),
('Eduarda Fernandes', 'eduarda.fernandes@university.edu'),
('Felipe Costa', 'felipe.costa@university.edu'),
('Giovana Lima', 'giovana.lima@university.edu'),
('Helena Rocha', 'helena.rocha@university.edu'),
('Igor Martins', 'igor.martins@university.edu'),
('Joana Alves', 'joana.alves@university.edu'),
('Kleber Santos', 'kleber.santos@university.edu'),
('Larissa Moreira', 'larissa.moreira@university.edu'),
('Marcelo Ribeiro', 'marcelo.ribeiro@university.edu'),
('Natália Azevedo', 'natalia.azevedo@university.edu'),
('Otávio Mendes', 'otavio.mendes@university.edu'),
('Patrícia Cunha', 'patricia.cunha@university.edu'),
('Quésia Torres', 'quesia.torres@university.edu'),
('Ricardo Vilar', 'ricardo.vilar@university.edu'),
('Sílvia Duarte', 'silvia.duarte@university.edu'),
('Tiago Barros', 'tiago.barros@university.edu'),
('Úrsula Gomes', 'ursula.gomes@university.edu'),
('Vitor Nunes', 'vitor.nunes@university.edu'),
('Wellington Pinto', 'wellington.pinto@university.edu'),
('Xênia Campos', 'xenia.campos@university.edu'),
('Yuri Lopes', 'yuri.lopes@university.edu'),
('Zara Ribeiro', 'zara.ribeiro@university.edu'),
('Arthur Menezes', 'arthur.menezes@university.edu'),
('Bianca Cardoso', 'bianca.cardoso@university.edu'),
('Caio Santana', 'caio.santana@university.edu');

-- 3.5 Empréstimos (20 registros)
-- Usaremos datas variadas; algumas devolvidas, outras em aberto; algumas atrasadas.
-- Para criação de exemplos: assumimos data format YYYY-MM-DD.
INSERT INTO loan (book_id, student_id, date_withdrawal, date_expected, date_returned) VALUES
(1, 1, '2025-09-01', '2025-09-15', '2025-09-14'),  -- devolvido em dia
(3, 2, '2025-09-05', '2025-09-19', NULL),          -- ainda não devolvido (em dia ou pode vencer)
(5, 3, '2025-08-01', '2025-08-15', '2025-08-20'),  -- devolvido atrasado
(7, 4, '2025-07-20', '2025-08-03', NULL),          -- atrasado (não devolvido)
(10, 5, '2025-09-10', '2025-09-24', '2025-09-23'),
(12, 6, '2025-10-01', '2025-10-15', NULL),
(15, 7, '2025-06-01', '2025-06-15', '2025-06-10'),
(18, 8, '2025-09-28', '2025-10-12', NULL),
(20, 9, '2025-08-15', '2025-08-29', '2025-08-29'),
(22, 10, '2025-10-01', '2025-10-15', NULL),
(24, 11, '2025-07-01', '2025-07-15', '2025-07-20'), -- devolvido atrasado
(2, 12, '2025-09-18', '2025-10-02', NULL),
(4, 13, '2025-05-10', '2025-05-24', '2025-05-22'),
(6, 14, '2025-10-05', '2025-10-19', NULL),
(8, 15, '2025-09-30', '2025-10-14', NULL),
(9, 16, '2025-08-20', '2025-09-03', '2025-09-05'),  -- atrasado
(11, 17, '2025-09-12', '2025-09-26', '2025-09-20'),
(13, 18, '2025-08-01', '2025-08-15', '2025-08-16'), -- atrasado por 1 dia
(14, 19, '2025-10-02', '2025-10-16', NULL),
(16, 20, '2025-09-01', '2025-09-15', '2025-09-10');

-- ===============================================
-- PASSO 4 - Consultas (READ) solicitadas
-- ===============================================

-- 4.1 Liste todos os livros com seus autores e categorias
SELECT
    b.id AS book_id,
    b.title AS book_title,
    b.year_publication,
    a.name AS author,
    c.name AS category
FROM book b
JOIN author a ON b.author_id = a.id
JOIN category c ON b.category_id = c.id
ORDER BY b.title;

-- 4.2 Liste os empréstimos mostrando: aluno, título do livro e datas
SELECT
    l.id AS loan_id,
    s.name AS student,
    s.email,
    b.title AS book_title,
    l.date_withdrawal,
    l.date_expected,
    l.date_returned
FROM loan l
JOIN student s ON l.student_id = s.id
JOIN book b ON l.book_id = b.id
ORDER BY l.date_withdrawal DESC;

-- 4.3 Liste apenas os empréstimos atrasados
-- Critério: se date_returned IS NULL e CURRENT_DATE > date_expected -> Atrasado
-- ou se date_returned IS NOT NULL e date_returned > date_expected -> Atrasado
SELECT
    l.id AS loan_id,
    s.name AS student,
    b.title AS book_title,
    l.date_withdrawal,
    l.date_expected,
    l.date_returned,
    CASE
        WHEN l.date_returned IS NULL AND CURRENT_DATE() > l.date_expected THEN 'Atrasado'
        WHEN l.date_returned IS NOT NULL AND l.date_returned > l.date_expected THEN 'Atrasado'
        ELSE 'Em dia'
    END AS status
FROM loan l
JOIN student s ON l.student_id = s.id
JOIN book b ON l.book_id = b.id
WHERE
    (l.date_returned IS NULL AND CURRENT_DATE() > l.date_expected)
    OR (l.date_returned IS NOT NULL AND l.date_returned > l.date_expected)
ORDER BY l.date_expected;

-- 4.4 Mostre os autores que têm mais de um livro na biblioteca
SELECT
    a.id AS author_id,
    a.name AS author,
    COUNT(b.id) AS books_count
FROM author a
JOIN book b ON b.author_id = a.id
GROUP BY a.id, a.name
HAVING COUNT(b.id) > 1
ORDER BY books_count DESC;

-- ===============================================
-- PASSO 5 - Atualizações e exclusões (UPDATE / DELETE)
-- ===============================================

-- 5.1 Atualize a categoria de um livro (ex: mudar 'Romance' para 'Clássico')
-- Primeiro inserir a nova categoria "Clássico" se não existir (caso já exista, esse comando falha por duplicata)
INSERT INTO category (name) VALUES ('Classic') ON DUPLICATE KEY UPDATE name = name;
-- Observação: usei 'Classic' em inglês para evitar colisão com 'Clássico' já usado; adapte se quiser.
-- Mudar categoria do livro id = 1 (Dom Casmurro) para category 'Classic'
UPDATE book
SET category_id = (SELECT id FROM category WHERE name = 'Classic' LIMIT 1)
WHERE id = 1;

-- 5.2 Alterar o e-mail de um aluno
UPDATE student
SET email = 'ana.silva_updated@university.edu'
WHERE name = 'Ana Silva';

-- 5.3 Excluir um autor e observar o que acontece com seus livros
-- Atenção: devido ao ON DELETE CASCADE em book.author_id, ao excluir o autor seus livros serão removidos automaticamente.
-- Por exemplo, excluímos o autor com id = 5 (Jane Austen)
DELETE FROM author WHERE id = 5;

-- Verificação: listar livros que tinham author_id = 5 (deve retornar zero)
SELECT * FROM book WHERE author_id = 5;

-- Reflexão (comentário): o ON DELETE CASCADE facilita manutenção, mas pode ser perigoso
-- porque uma exclusão acidental de autor remove todos os livros relacionados sem aviso.
-- Em cenários reais, é comum usar ON DELETE RESTRICT ou proteger via lógica de negócio.

-- ===============================================
-- PASSO 6 - Desafio extra (VIEW e consultas agregadas)
-- 6.1 Criar VIEW vw_loans que mostre: título do livro, aluno, data prevista e status (Em dia / Atrasado)
-- ===============================================

DROP VIEW IF EXISTS vw_loans;
CREATE VIEW vw_loans AS
SELECT
    l.id AS loan_id,
    b.title AS book_title,
    s.name AS student,
    l.date_expected,
    -- Determina status:
    CASE
        WHEN l.date_returned IS NULL AND CURRENT_DATE() > l.date_expected THEN 'Atrasado'
        WHEN l.date_returned IS NOT NULL AND l.date_returned > l.date_expected THEN 'Atrasado'
        ELSE 'Em dia'
    END AS status
FROM loan l
JOIN book b ON l.book_id = b.id
JOIN student s ON l.student_id = s.id;

-- Exemplo de uso da view:
SELECT * FROM vw_loans ORDER BY date_expected;

-- 6.2 Consulta que mostra a quantidade de livros emprestados por categoria
-- Contamos empréstimos ativos (date_returned IS NULL) por categoria (ou todos os empréstimos se quiser)
SELECT
    c.name AS category,
    COUNT(l.id) AS loans_count
FROM loan l
JOIN book b ON l.book_id = b.id
JOIN category c ON b.category_id = c.id
WHERE l.date_returned IS NULL   -- só empréstimos ainda não devolvidos
GROUP BY c.name
ORDER BY loans_count DESC;

-- Também podemos mostrar total histórico (incluindo devolvidos)
SELECT
    c.name AS category,
    COUNT(l.id) AS total_loans_history
FROM loan l
JOIN book b ON l.book_id = b.id
JOIN category c ON b.category_id = c.id
GROUP BY c.name
ORDER BY total_loans_history DESC;

-- ===============================================
-- Consultas extras úteis para apresentação
-- ===============================================

-- Exemplo de JOIN mais complexo: listar alunos com quantidade de livros emprestados (ativos)
SELECT
    s.id AS student_id,
    s.name AS student,
    s.email,
    COUNT(l.id) AS active_loans
FROM student s
LEFT JOIN loan l ON s.id = l.student_id AND l.date_returned IS NULL
GROUP BY s.id, s.name, s.email
ORDER BY active_loans DESC, s.name;

-- Mostrar livros sem empréstimos (disponíveis)
SELECT
    b.id,
    b.title
FROM book b
LEFT JOIN loan l ON b.id = l.book_id AND l.date_returned IS NULL
WHERE l.id IS NULL
ORDER BY b.title;

-- ===============================================
-- Observações finais e reflexões (comentadas)
-- ===============================================
/*
1) Por que usamos JOINs?
   - JOINs são necessários quando queremos relacionar informações que estão em tabelas diferentes.
     Ex.: para listar o título do livro e o nome do autor, precisamos juntar book com author via author_id.
   - Sem JOINs, a informação normalizada em diferentes tabelas não poderia ser combinada em uma única consulta.

2) Por que ON DELETE CASCADE pode ser perigoso?
   - ON DELETE CASCADE automaticamente remove linhas dependentes (ex.: ao apagar um author, todos os books do author são apagados).
   - Em produção pode levar a perda de dados importante por exclusões acidentais.
   - Alternativas: ON DELETE RESTRICT ou lógica de negócio que impeça exclusão se houver dependências.

3) VIEW vw_loans:
   - Facilita exibir um relatório padrão (título, aluno, data prevista, status).
   - A view simplifica queries para a apresentação e reuso em relatórios.

4) Ajustes possíveis:
   - Adicionar histórico de penalidades, tabelas de reserva, tabelas de funcionários.
   - Adicionar colunas de controle (created_at, updated_at) para auditoria.
*/

-- ===============================================
-- FIM DO SCRIPT
-- ===============================================