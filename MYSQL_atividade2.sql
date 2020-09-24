create database if not exists db_universidade;

use db_universidade;

create table if not exists tbl_aluno (
mat varchar (10) not null primary key,
nome varchar (80) not null,
endereco varchar (80) not null,
cidade varchar (40) not null);

create table if not exists tbl_disciplina (
cod_disc varchar (5), 
nome_disc varchar (50) not null,
carga_hor varchar (5) not null,
primary key (cod_disc));

create table if not exists tbl_professor (
cod_prof varchar (7) primary key,
nome varchar (60) not null,
endereco varchar (60) not null,
cidade varchar (60) not null);

create table if not exists tbl_turma (
cod_disc varchar (5) not null,
cod_turma varchar (4) not null,
cod_prof varchar (7) not null,
ano year not null,
horario varchar (7) not null,
primary key (cod_disc, cod_turma, cod_prof, ano),
constraint fk_turma_disc foreign key (cod_disc) references tbl_disciplina (cod_disc),
constraint fk_turma_professor foreign key (cod_prof) references tbl_professor (cod_prof));

create table if not exists tbl_historico (
mat varchar(10) not null,
cod_disc varchar(5) not null,
cod_turma varchar (4) not null,
cod_prof varchar (7) not null,
ano year not null,
frequencia varchar (3) not null,
nota float not null,
#declarando chave primária
primary key (mat, cod_disc, cod_prof, ano),
#declarando chave estrangeira 
constraint fk_historico_aluno foreign key (mat) references
 tbl_aluno (mat),
 constraint fk_historico_turma foreign key (cod_disc, cod_turma, cod_prof, ano)
 references tbl_turma (cod_disc, cod_turma, cod_prof, ano));
 
 -- Popular as tabelas (inserir os dados)
 
 insert into tbl_aluno (mat, nome, endereco, cidade) values
 ('2015010101', 'JOSE DE ALENCAR', 'RUA DAS ALMAS', 'NATAL'), ('2015010102', 'JOÃO JOSÉ', 'AVENIDA RUY CARNEIRO', 'JOÃO PESSOA'), 
 ('2015010103', 'MARIA JOAQUINA', 'RUA CARROSSEL', 'RECIFE'),  ('2015010104', 'MARIA DAS DORES', 'RUA DAS LADEIRAS', 'FORTALEZA'), 
 ('2015010105', 'JOSUÉ CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL'), ('2015010106', 'JOSUÉLISSON CLAUDINO DOS SANTOS', 'CENTRO', 'NATAL');  
 
select * from tbl_aluno;

insert into tbl_disciplina (cod_disc, nome_disc, carga_hor) values 
('BD', 'BANCO DE DADOS', '100'), ('POO', 'PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS', '100'), 
('WEB', 'AUTORIA WEB', '50'), ('ENG', 'ENGENHARIA DE SOFTWARE', '80');

select * from tbl_disciplina;

insert into tbl_professor (cod_prof, nome, endereco, cidade) values
('212131', 'NICKERSON FERREIRA', 'RUA MANAÍRA', 'JOÃO PESSOA'), ('122135', 'ADORILSON BEZERRA', 'AVENIDA SALGADO FILHO', 'NATAL'), 
('192011', 'DIEGO OLIVEIRA', 'AVENIDA ROBERTO FREIRE', 'NATAL');

select * from tbl_professor;

insert into tbl_turma (cod_disc, cod_turma, cod_prof, ano, horario) values
('BD', '1', '212131', '2015', '11H-12H'), ('BD', '2', '212131', '2015', '13H-14H'), 
('POO', '1', '192011', '2015', '08H-09H'), ('WEB', '1', '192011', '2015', '07H-08H'), 
('ENG', '1', '122135', '2015', '10H-11H');

select * from tbl_turma;

# FREQUÊNCIA É O NÚMERO (PERCENTUAL) DE HORAS QUE O ALUNO CURSOU
# ALTERAR O TAMANHO DO CAMPO FREQUÊNCIA PARA VARCHAR (4)
alter table tbl_historico modify column frequencia varchar(4);

insert into tbl_historico (mat, cod_disc, cod_turma, cod_prof, ano, frequencia, nota) values
('2015010106', 'ENG', '1', '122135', '2015', '90%', 7.5);

# A) Encontrar a MAT dos alunos com nota em BD em 2015 menor que 5.
# BD = código das disciplinas.

select mat from tbl_historico where cod_disc= 'BD' and ano='2015'
and nota<6; 

# B) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO em 2015. 

select mat, avg(nota) from tbl_historico where
cod_disc = 'BD' and ano = '2015';

# C) Encontre a MAT e calcule a média das notas dos alunos na disciplina de POO em 2015 e que esta média seja superior a 6. 

select mat, avg(nota) as media from tbl_historico where
cod_disc = 'POO' and ano = '2015' having media>6; 

# D) Encontre quantos alunos não são de Natal. 

select cidade, count(mat) from tbl_aluno where
 cidade <>'Natal'; 
 
 select cidade from tbl_aluno where cidade<>'Natal';
 
 -- THE END --
