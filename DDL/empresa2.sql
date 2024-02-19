create table empregado(
	ssn char(5) primary key,
	enome varchar(20) not null unique,
	datanasc date,
	endereco varchar(50)not null,
	dnumero char(5) not null,
	check(datanasc > '1-01-1900') 
);

create table departamento(
	dnome varchar(20) not null,
	dnumero char(5) primary key,
	dgerssn char(5)not null,
	foreign key(dgerssn) references empregado(ssn)
);

alter table empregado add foreign key(dnumero) references departamento(dnumero);

create table dept_localizações(
	dnumero char(5),
	dlocalização char(5),
	foreign key(dnumero) references departamento(dnumero),
	primary key(dnumero, dlocalização)
);

create table projeto(
	pnome varchar(20) not null,
	pnumero char(5) primary key,
	plocalizacao varchar(50) not null,
	dnum char(5)not null,
	foreign key(dnum) references departamento(dnumero)
);

create table trabalha(
	ssn char(5),
	pnumero char(5),
	horas numeric check(horas > 0),
	foreign key(ssn) references empregado(ssn),
	foreign key(pnumero) references projeto(pnumero),
	primary key(ssn, pnumero)
);