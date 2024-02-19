select *
from turma

select * 
from aluno

select *
from professor

select *
from matricula

select *
from disciplina



-- Retorne o nome das turmas com o nome dos seus respectivos professores
select t.nome, p.nome
from turma t, professor p
where t.professor = p.codigo

-- Retorne o nome das turmas do professor cujo CPF é igual a um determinado valor
select t.nome
from turma t, professor p
where t.professor = p.codigo and p.cpf = '02091602680'

-- Retorne o nome dos alunos e código das turmas somente para as matrículas com status reprovado
select a.nome, t.codigo, m.status
from matricula m, aluno a, turma t
where m.coda = a.mat and m.codt = t.codigo and m.status = 'R'

-- Retorne o nome do aluno e o código das turmas que está matriculado 
-- considerando incluindo os alunos que não estão matriculados em turmas.
select a.nome, t.codigo
from matricula m 
join turma t on m.codt = t.codigo
right join aluno a on m.coda = a.mat 

-- Retorne o nome da disciplina e o código das turmas associadas 
-- incluindo as disciplinas que não possuem turma.
select d.nome, t.codigo
from disciplina d left join turma t
on d.codigo = t.disciplina
