CREATE TABLE alunos(
mat SERIAL PRIMARY KEY NOT NULL,
nome VARCHAR(45) NOT NULL, 
endereço VARCHAR(45) NOT NULL, 
cidade VARCHAR(45) NOT NULL
);


CREATE TABLE disciplinas(
cod_disc VARCHAR(10) PRIMARY KEY NOT NULL, 
nome_disc VARCHAR(45) NOT NULL, 
carga_hor NUMERIC(5,0)
);

CREATE TABLE professores(
cod_prof SERIAL PRIMARY KEY NOT NULL, 
nome VARCHAR (45) NOT NULL,
endereço VARCHAR(45) NOT NULL,
cidade VARCHAR(45) NOT NULL
);

CREATE TABLE turma(
cod_turma SERIAL NOT NULL, 
cod_disc VARCHAR,
cod_prof INTEGER, 
ano INTEGER NOT NULL, 
horario VARCHAR(20),
PRIMARY KEY (cod_disc, cod_turma, cod_prof, ano),
FOREIGN KEY (cod_disc) REFERENCES disciplinas(cod_disc),
FOREIGN KEY (cod_prof) REFERENCES professores(cod_prof)
);

CREATE TABLE historico(
mat INTEGER REFERENCES alunos(mat),
cod_disc VARCHAR REFERENCES disciplinas(cod_disc),
cod_prof INTEGER REFERENCES professores(cod_prof),
cod_turma INTEGER,
ano INTEGER, 
frequencia INTEGER NOT NULL, 
nota NUMERIC(3,1), 
PRIMARY KEY(mat, cod_disc, cod_turma, cod_prof, ano),
FOREIGN key(cod_disc, cod_turma, cod_prof, ano) REFERENCES turma (cod_disc, cod_turma, cod_prof, ano)
);

INSERT INTO alunos(mat, nome, endereço, cidade)
VALUES
(2015010101, 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'BANANAL'),
(2015010102, 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'IMPERATRIZ'),
(2015010103, 'MARIA JOAQUINA', 'RUA CARROSSEL', 'SÃO LUIS'),
(2015010104, 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'AÇAILÂNDIA'),
(2015010105, 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'BANANAL'), 
(2015010106, 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'BANANAL');

INSERT INTO disciplinas(cod_disc, nome_disc, carga_hor)
VALUES
('BD', 'BANCO DE DADOS', 100),
('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', 100),
('WEB', 'AUTORIA WEB', 50),
('ENG', 'ENGENHARIA DE SOFTWARE', 80);

INSERT INTO professores(cod_prof, nome, endereço, cidade)
VALUES
(212131, 'SIMONE BANDEIRA', 'RUA MANAÍRA', 'IMPERATRIZ'),
(122135, 'ANDERSON CAVALCANTE', 'AVENIDA SALGADO FILHO', 'BANANAL'),
(192011, 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'BANANAL'); 

INSERT INTO turma(cod_disc, cod_turma, cod_prof, ano, horario)
VALUES
('BD', 1, 212131, 2015, '11H-12H'),
('BD', 2, 212131, 2015, '13H-14H'),
('POO', 1, 192011, 2015, '08H-09H'),
('WEB', 1, 192011, 2015, '07H-08H'),
('ENG', 1, 122135, 2015, '10H-11H');


--------ALUNO 1--------------
INSERT INTO historico(mat, cod_disc, cod_prof, cod_turma, ano, frequencia, nota)
VALUES
(2015010101, 'BD', 212131, 1, 2015, 90, 7.5),
(2015010101, 'POO', 192011, 1, 2015, 60, 10), 
(2015010101, 'WEB', 192011, 1, 2015, 70, 8.5),
(2015010101, 'ENG', 122135, 1, 2015, 50, 5);

------------ALUNO 2-------------
INSERT INTO historico(mat, cod_disc, cod_prof, cod_turma, ano, frequencia, nota)
VALUES

(2015010102, 'BD', 212131, 2, 2015, 85, 4), 
(2015010102, 'POO', 192011, 1, 2015, 60, 9), 
(2015010102, 'WEB', 192011, 1, 2015, 70, 8.5),
(2015010102, 'ENG', 122135, 1, 2015, 80, 5); 

---------------ALUNO 3-------------------
INSERT INTO historico(mat, cod_disc, cod_prof, cod_turma, ano, frequencia, nota)
VALUES
(2015010103, 'BD', 212131, 2, 2015, 100, 7), 
(2015010103, 'POO', 192011, 1, 2015, 50, 10), 
(2015010103, 'WEB', 192011, 1, 2015, 85, 8.5),
(2015010103, 'ENG', 122135, 1, 2015, 50, 10); 

-----------------ALUNO 4--------------------------
iNSERT INTO historico(mat, cod_disc, cod_prof, cod_turma, ano, frequencia, nota)
VALUES
(2015010104, 'BD', 212131, 1, 2015, 20, 10),
(2015010104, 'POO', 192011, 1, 2015, 75, 10), 
(2015010104, 'WEB', 192011, 1, 2015, 60, 8),
(2015010104, 'ENG', 122135, 1, 2015, 10, 5); 

------------------------ALUNO 5 ---------------------

INSERT INTO historico(mat, cod_disc, cod_prof, cod_turma, ano, frequencia, nota)
VALUES
(2015010105, 'BD', 212131, 2, 2015, 85, 8), 
(2015010105, 'POO', 192011, 1, 2015, 90, 10), 
(2015010105, 'WEB', 192011, 1, 2015, 80, 8.5),
(2015010105, 'ENG', 122135, 1, 2015, 100, 10) 
 
 ---------------------ALUNO 6 ---------------------------
INSERT INTO historico(mat, cod_disc, cod_prof, cod_turma, ano, frequencia, nota)
VALUES
(2015010106, 'BD', 212131, 1, 2015, 70, 5), 
(2015010106, 'POO', 192011, 1, 2015, 60, 17), 
(2015010106, 'WEB', 192011, 1, 2015, 80, 8.5),
(2015010106, 'ENG', 122135, 1, 2015, 55, 10);

---LETRA A--
SELECT DISTINCT h.mat
FROM historico h
WHERE h.cod_disc = 'BD' 
AND h.ano = 2015 
AND h.nota < 5;

--LETRA B---
SELECT h.mat, AVG(h.nota) AS media_notas
FROM historico h
WHERE h.cod_disc = 'POO' 
  AND h.ano = 2015
GROUP BY h.mat;

---LETRA C---
SELECT h.mat, AVG(h.nota) AS media_notas
FROM historico h
WHERE h.cod_disc = 'POO' 
  AND h.ano = 2015
GROUP BY h.mat
HAVING AVG(h.nota) > 6;

---LETRA D-----
SELECT COUNT(*) AS total_alunos_nao_bananal
FROM alunos
WHERE cidade <> 'BANANAL';









 
 
 
 




















 
 



 
 
 
 
 
 
 
 
 
 
 