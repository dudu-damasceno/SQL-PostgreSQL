create table aluno(
	cpf char(11) primary key,
	nome varchar(50),
	matricula char(5)
);

create table professor(
	cpf char(11) primary key,
	nome varchar(50),
	salario integer
);

create table turma(
	numero char(5) primary key,
	sala varchar(10),
	horario integer,
	dcodigo char(5),
	pcpf char(11),
	foreign key(pcpf) references professor(cpf)
);

create table disciplina(
	codigo char(5) primary key,
	nome varchar(50),
	numCredito integer,
	pcpf char(11)
)