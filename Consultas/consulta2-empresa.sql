select * from funcionario
select * from alocacao

-- Retorne o código dos funcionários que já trabalharam em todos os projetos
select f.codigo
from funcionario f
where (select count(*) from projeto p) = 
(select count(*) from alocacao a 
where f.codigo = a.codf)

-- Retorne o nome dos funcionários que já trabalharam em todos os projetos
select f.nome
from funcionario f
where (select count(*) from projeto p) = 
(select count(*) from alocacao a
where f.codigo = a.codf)

-- Retorne todos os funcionários que trabalham no mesmo departamento que o de código = 11111
select *
from funcionario f
where f.coddept = ALL(select ff.coddept from funcionario ff where coddept = '11111')


-- Retorne todos os projetos que possuem a mesma combinação de datas do projeto com código = 111111
select *
from projeto p 
where p.datainicial = ALL(select pp.datainicial from projeto pp where pp.codigo = '11111')