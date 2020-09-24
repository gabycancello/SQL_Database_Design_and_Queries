create database if not exists db_faculdade;

use db_faculdade;

create table if not exists tbl_aluno (
id_aluno tinyint auto_increment primary key,
nome_aluno varchar(50) not null,
sobrenome_aluno varchar(100) not null,
endereco_aluno integer(100),
data_nasc date not null,
cidade varchar(30) not null,
estado varchar(30) not null,
cep smallint not null,
telefone smallint not null);



create table if not exists tbl_professor (
id_professor tinyint auto_increment primary key,
nome_professor varchar(50) not null,
sobrenome_aluno varchar(100) not null,
endereco_aluno integer(100),
data_nasc date not null,
cidade varchar(30) not null,
estado varchar(30) not null,
cep smallint not null,
telefone smallint not null);

create table if not exists tbl_turma (
id_turma tinyint auto_increment primary key,
inicio_turma integer(20) not null,
termino_turma integer(20) not null,
nome_turma varchar(50) not null,
num_alunos smallint(100) not null);

create table if not exists tbl_departamento (
id_departamento tinyint auto_increment primary key,
nome_dep varchar(30) not null
);
