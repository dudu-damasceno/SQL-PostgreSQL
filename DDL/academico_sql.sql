create type semestre as enum('1', '2');
create type status as enum('A', 'R', 'C');
create table aluno(
	mat char(10) primary key,
	cpf char(11),
	identidade char(9),
	nome varchar(30),
	email varchar(30)
);
create table professor(
	codigo char(10) primary key,
	nome varchar(20),
	cpf char(11),
	email varchar(30)
);
create table disciplina(
	codigo char(10) primary key,
	nome varchar(20),
	ementa varchar(30)
);
create table turma(
	codigo char(10) primary key,
	nome varchar(20),
	disciplina char(10),
	professor char(10),
	foreign key(disciplina) references disciplina(codigo),
	foreign key(professor) references professor(codigo)
);
create table matricula(
	coda char(10),
	codt char(10),
	ano integer,
	semestre semestre,
	nota integer,
	status status,
	foreign key(coda) references aluno(mat),
	foreign key(codt) references turma(codigo)
);