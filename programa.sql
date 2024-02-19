-- TA FALANDO QUE EU N POSSO ESCREVER CHAR??? 
create table cliente(
	no_cliente character(5) primary key,
	nome varchar(50) not null,
	cgcj char(5) not null unique
);

create table projeto(
	id char(5) primary key,
	nome varchar(50) not null unique,
	no_cliente char(5) not null,
	foreign key(no_cliente) references cliente(no_cliente)
);
-- ME AJUDA GIAN integer
create table desenvolvedor(
	codigo char(5) primary key,
	nome varchar(50) not null,
	custo integer  not null,
	check(custo > 0)
);

create table alocacao(
	pcodigo char(5),
	dcodigo char(5),
	de date,
	ate date not null,
	primary key(pcodigo, dcodigo, de),
	foreign key (pcodigo) references projeto(id),
	foreign key (dcodigo) references desenvolvedor(codigo)
)	

-- CLIENTE INSERIDO
insert into cliente
values('10000', 'fabiola', '12345');
insert into cliente
values('20000', 'redney', '54321');

-- PROJETO INSERIDO
insert into projeto
values('10000', 'amantiqueer','10000');
insert into projeto
values('20000', 'nmcm', '20000');

-- Desenvolvedor inserido
insert into desenvolvedor
values('10000', 'Duda', 15000);
insert into desenvolvedor
values('20000', 'Mel', 15000);

-- Alocação inserido
insert into alocacao
values('10000', '10000', '2022-01-01', '2023-06-01');
insert into alocacao
values('20000', '20000', '2023-01-01', '2023-12-30');

-- Consulta
select *
from cliente

select *
from projeto

select * 
from desenvolvedor

select *
from alocacao

select a.de, p.nome
from alocacao a join projeto p on
a.pcodigo = p.id

select p.nome, c.nome
from projeto p join cliente c on
p.no_cliente = c.no_cliente

insert into projeto
values('30000', 'dança', '30000')

-- Retornar o nome e o CGCJ de todos os clientes que possuem o número entre 45 e 162
select nome, cgcj
from cliente
where cgcj between '40000' and '60000'

-- Retornar os dados de todos os desenvolvedores cujo custo é maior que 5500
select *
from desenvolvedor 
where custo > 5500

-- Retornar os dados dos projetos do cliente cujo nome é igual a José da Silva Xavier
select *
from projeto p join cliente c on
p.no_cliente = c.no_cliente
where c.nome= 'José da Silva Xavier'

-- Retornar os dados das alocações (código do desenvolvedor, de e até) do projeto de id = 10000
select dcodigo, de
from alocacao 
where pcodigo = '10000'

-- Retornar o nome do projeto e os dados das alocações (id do desenvolvedor, de e até) do projeto de id = 10000
select p.nome, a.dcodigo, a.de, a.ate
from alocacao a join projeto p on
a.pcodigo = p.id
where pcodigo = '10000'

--  Retornar os dados das alocações (id do projeto, de e até) dos desenvolvedores cujo custo é maior que 2500
select a.pcodigo, a.de, a.ate
from alocacao a join desenvolvedor d on
a.dcodigo = d.codigo
where d.custo > 2500

--  Retornar o nome do projeto, os dados das alocações (de e até) e o nome dos 
-- desenvolvedores de todos os desenvolvedores cujo custo é maior que 2500
select p.nome, a.de, a.ate, d.nome
from alocacao a join projeto p on
a.pcodigo = p.id join desenvolvedor d on
a.dcodigo = d.codigo
where d.custo > 2500

