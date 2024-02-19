select *
from empregado

select *
from departamento

select *
from projeto

select *
from trabalha


-- Retorne o nome dos empregados e o nome do departamento onde trabalham ordenados pelo nome 
-- do empregado (crescente) e nome do departamento (decrescente)
select e.enome, d.dnome
from empregado e, departamento d
where e.dnumero = d.dnumero order by e.enome ASC


-- Retorne o nome do departamento e o nome do seu gerente
select d.dnome, e.enome
from departamento d, empregado e
where d.dgerssn = e.ssn

-- Retorne o nome do gerente do departamento Saude
select e.enome
from departamento d, empregado e
where d.dgerssn = e.ssn and d.dnome = 'Saude'

-- Retorne o nome dos projetos nos quais o funcionário com SSN = 44444 trabalhou mais de 5 horas.
select p.pnome, e.enome
from projeto p , empregado e, trabalha t
where t.ssn = e.ssn and t.pnumero = p.pnumero and t.ssn= '44444' and t.horas > 5

--  Retorne a soma de todas as horas trabalhadas.
select sum(horas) 
from trabalha

-- Retorne a soma de todas as horas trabalhadas por projeto (número do projeto).
select sum(horas), pnumero
from trabalha
group by(pnumero)

--  Retorne a soma de todas as horas trabalhadas por empregado (ssn do empregado).
select sum(horas), ssn
from trabalha
group by(ssn)

-- Retorne a soma das horas trabalhadas por empregado (ssn) considerando somente 
-- aqueles que trabalharam mais de 60 horas.
select sum(horas), ssn
from trabalha
group by(ssn)
having sum(horas) > 60

-- Retorne o valor da quantidade máxima de horas trabalhadas. ME AJUDA GIAN(AQUI EU QUERO COLCOAR PRA APARECER OUTRO ATRIBUTO TB, MAS ELE N DEIXA)
select max(horas)
from trabalha

-- Retorne o valor da quantidade máxima de horas trabalhadas por empregado. 
select max(horas), ssn
from trabalha
group by(ssn)

-- Retorne o valor da quantidade máxima de horas trabalhadas no projeto de código P001.
select max(horas)
from trabalha
where pnumero = '30000'

-- Retorne o código do departamento e a quantidade de funcionários de cada um.
select count(ssn) , dnumero 
from empregado
group by(dnumero)
order by dnumero

-- Retorne o nome do departamento e a quantidade de funcionários de cada um.
select d.dnome, count(e.ssn)
from departamento d left join empregado e on 
d.dnumero= e.dnumero
group by (d.dnome)

-- Retorne o nome do departamento e a quantidade de funcionários de cada um 
-- considerando somente os departamentos que possuem a string u no nome
select d.dnome, count(e.ssn)
from departamento d join empregado e on
d.dnumero = e.dnumero
group by (d.dnome)
having d.dnome like '%u%'

-- Retorne o nome do departamento e a quantidade de funcionários de cada um 
-- considerando somente os departamentos que possuem a string u no nome e os 
-- departamentos que possuem mais de 1 empregados
select d.dnome, count(e.ssn)
from departamento d join empregado e on
d.dnumero = e.dnumero 
group by(d.dnome)
having d.dnome like '%s%' and count(e.ssn) > 1

