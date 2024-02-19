select *
from funcionario

select *
from departamento

select *
from projeto

select *
from alocacao

select *
from telefone


-- Retorne o nome dos funcionários com os nome do seu respectivo departamento
select f.nome, d.nome
from funcionario f, departamento d
where f.coddept = d.codigo

-- Retorne o nome do projeto e o nome dos funcionários alocados no projeto
select p.nome, f.nome
from alocacao a, projeto p, funcionario f
where a.codp = p.codigo and a.codf = f.codigo

-- Retorne o nome do funcionários com seus respectivos números de telefone
select f.nome, t.numtel
from funcionario f, telefone t
where f.codigo = t.codf

-- Retorne o nome do departamento e o nome dos seus respectivos funcionários incluindo os 
-- departamentos que não possuem funcionário
select f.nome, d.nome
from funcionario f right join departamento d on
f.coddept = d.codigo

-- Retorne o nome do projeto e o código dos funcionários alocados incluindo os 
-- projetos que não possuem funcionários alocados
select p.nome, f.codigo
from alocacao a join funcionario f on a.codf = f.codigo
right join projeto p on a.codp = p.codigo

-- Retorne a quantidade de funcionários que possuem @unifei no email
select count(*)
from funcionario 
where email like '%@unifei%'

-- Retorne a soma de horas trabalhadas em todos os projetos
select sum(qntd_horas)
from alocacao

-- Retorne a soma de horas trabalhadas em todos os projetos no ano de 2023-09-01
select sum(qntd_horas)
from alocacao
where datai > '2023-09-01'

-- Retorne a quantidade de funcionários por departamento
select count(f.coddept), d.nome
from funcionario f right join departamento d on 
f.coddept = d.codigo
group by(d.codigo)

--  Retorne a soma da quantidade de horas por projeto
select sum(a.qntd_horas), p.nome
from alocacao a right join projeto p on
a.codp = p.codigo
group by(p.codigo)

-- Retorne a soma da quantidade de horas por projetos, somente para aqueles cuja soma > 100
select sum(a.qntd_horas), p.nome
from alocacao a right join projeto p on
a.codp = p.codigo
group by(p.codigo)
having sum(a.qntd_horas) > 100

-- Retorne a soma da quantidade de horas por projetos, somente para aqueles que iniciaram em 2023-08-01 e cuja soma > 100
select sum(a.qntd_horas), p.nome
from alocacao a join projeto p on 
a.codp = p.codigo
where datai > '2023-08-01'
group by(p.codigo)
having sum(a.qntd_horas) > 100



