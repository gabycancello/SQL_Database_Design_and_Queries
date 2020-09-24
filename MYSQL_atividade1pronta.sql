# Exercicio 1

create database if not exists db_loja_tarde;

use db_loja_tarde;

create table if not exists tbl_vendas (
id_nf  tinyint not null,
id_item tinyint not null,
cod_prod tinyint not null,
valor_unit float not null,
quantidade tinyint not null,
desconto tinyint null,
# 1 chave primária composta por 2 campos
primary key(id_nf, id_item, cod_prod));

#inserindo informações na tabela
insert into tbl_vendas (id_nf, id_item, cod_prod, valor_unit, quantidade, 
desconto) values (1,1,1,25,10,5),
(1,2,2,13.50,3,null),
(1,3,3,15,2,null), (
	1,
    4,
    4,
    10.00,
    1,
    null
), (
	1,
    5,
    5,
    30.00,
    1,
    null
), (
	2,
    1,
    3,
   15.00,
    4,
    null
), (
	2,
    2,
    4,
    10.00,
    5,
    null
), (
	2,
    3,
    5,
    30.00,
    7,
    null
), (
	3,
    1,
    1,
    25.00,
    5,
    null
), (
	3,
    2,
    4,
    10.00,
    4,
    null
), (
	3,
    3,
    5,
    30.00,
    5,
    null
), (
	3,
    4,
    2,
    13.50,
    7,
    null
), (
	4,
    1,
    5,
    30.00,
    10,
    15
), (
	4,
    2,
    4,
    10.00,
    12,
    5
), (
	4,
    3,
    1,
    25.00,
    13,
    5
), (
	4,
    4,
    2,
    13.50,
    15,
    5
), (
	5,
    1,
    3,
    15.00,
    3,
    null
), (
	5,
    2,
    5,
    30.00,
    6,
    null
), (
	6,
    1,
    1,
    25.00,
    22,
    15
), (
	6,
    2,
    3,
    15.00,
    25,
    20
), (
	7,
    1,
    1,
    25.00,
    10,
    3
), (
	7,
    2,
    2,
    13.50,
    10,
    4
), (
	7,
    3,
    3,
    15.00,
    10,
    4
), (
	7,
    4,
    5,
    30.00,
    10,
    1
);

# Exercícios

# a) Pesquise os itens que foram vendidos sem desconto
# As colunas presentes no resultado da consulta são: id_nf, id_item, cod_prod e valor_unit

select id_nf, id_item, cod_prod, valor_unit from tbl_vendas
where desconto is null;

# b) pesquise os itens que foram vendidos com descontos
# As colunas presentes no resultado da consulta são: 
# id_nf, id_item, cod_prod, valor_unit e o valor vendido
# virtual - não está gravada na tabela
# O valor vendido é igual ao valor_unit (valor_unit*(desconto/100))

select id_nf, id_item, cod_prod, valor_unit,
valor_unit-valor_unit*desconto/100 as valor_vendido from tbl_vendas where desconto is not null;

# c) Altere o valor do desconto (para zero) de todos os registros 
# onde este campo é nulo
# alterar registros update --> alter table (estrutura tabela)

SET SQL_SAFE_UPDATES=0;
update tbl_vendas set desconto = 0 where desconto is null;

# D) Pesquise os itens que foram vendidos 

select id_nf, id_item, cod_prod, valor_unit, quantidade,
quantidade*valor_unit
as valor_total, desconto, valor_unit - valor_unit * desconto /100
as valor_vendido from tbl_vendas;

# E) Pesquise o valor total das NF e ordene o resultado do maior valor para o menor. As
# colunas presentes no resultado da consulta são: ID_NF, VALOR_TOTAL. OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. Agrupe o
# resultado da consulta por ID_NF.

select id_nf, sum(quantidade*valor_unit) as valor_total
from tbl_vendas group by id_nf order by valor_total desc;

# F) Pesquise o valor vendido das NF e ordene o resultado do maior valor para o menor. As
# colunas presentes no resultado da consulta são: ID_NF, VALOR_VENDIDO. OBS: O
# VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE * VALOR_UNIT. O
# VALOR_VENDIDO é igual a ∑ VALOR_UNIT - (VALOR_UNIT*(DESCONTO/100)).
# Agrupe o resultado da consulta por ID_NF

select id_nf, sum(valor_unit-valor_unit*desconto/100) as valor_vendido,
  sum(quantidade*valor_unit) as valor_total from tbl_vendas
  group by id_nf order by valor_vendido desc;

# G) Consulte o produto que mais vendeu no geral. As colunas presentes no resultado da
# consulta são: COD_PROD, QUANTIDADE. Agrupe o resultado da consulta por COD_PROD

select cod_prod, sum(quantidade) from tbl_vendas
group by cod_prod order by sum(quantidade) desc limit 1;

# H) Consulte as NF que foram vendidas mais de 10 unidades de pelo menos um produto.
# As colunas presentes no resultado da consulta são: ID_NF, COD_PROD, QUANTIDADE.
# Agrupe o resultado da consulta por ID_NF, COD_PROD

select id_nf, cod_prod, quantidade from tbl_vendas
where quantidade>10 group by id_nf;

# I) Pesquise o valor total das NF, onde esse valor seja maior que 500, e ordene o
# resultado do maior valor para o menor. As colunas presentes no resultado da consulta
# são: ID_NF, VALOR_TOT. OBS: O VALOR_TOTAL é obtido pela fórmula: ∑ QUANTIDADE
#* VALOR_UNIT. Agrupe o resultado da consulta por ID_NF

#valor_total = sum(quantidade*valor_unit)

select id_nf, sum(quantidade*valor_unit) as valor_tot from tbl_vendas
group by id_nf having valor_tot>500 order by valor_tot;

# J) Qual o valor médio dos descontos dados por produto. As colunas presentes no
# resultado da consulta são: COD_PROD, MEDIA. Agrupe o resultado da consulta por COD_PRO

select cod_prod, avg(desconto) from tbl_vendas group by cod_prod;
# media = soma/num itens

# K) Qual o menor, maior e o valor médio dos descontos dados por produto. As colunas
# presentes no resultado da consulta são: COD_PROD, MENOR, MAIOR, MEDIA. Agrupe
# o resultado da consulta por COD_PROD

select cod_prod, sum(desconto) as soma, count(desconto) as num_descontos, 
max_desconto as maior_desconto, min(desconto) as menor_desconto,
 avg(desconto) as Media_desconto from tbl_vendas
group by cod_prod;

# L) Quais as NF que possuem mais de 3 itens vendidos. As colunas presentes no resultado
# da consulta são: ID_NF, QTD_ITENS. OBS:: NÃO ESTÁ RELACIONADO A QUANTIDADE
# VENDIDA DO ITEM E SIM A QUANTIDADE DE ITENS POR NOTA FISCAL. Agrupe o
# resultado da consulta por ID_NF.

select id_nf, count(quantidade) as qtdeItens from tbl_vendas
group by cod_prod;
