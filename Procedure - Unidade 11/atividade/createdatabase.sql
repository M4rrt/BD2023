Create table Cliente(
	CodigoCliente int primary key identity not null,
	Nome varchar(60) not null,
	CPF char(11) not null,
	Sexo char(1) not null,
	DataNascimento date not null,
	CidadeResidencia varchar(50) not null,
	Email varchar(70) not null,
	Senha varchar(50) not null
)

Create table Marca(
	CodigoMarca smallint primary key identity not null,
	Nome varchar(60) not null,
)

Create table Modelo(
	CodigoModelo int primary key identity,
	Nome varchar(60) not null,
	CodigoMarca smallint foreign key references Marca(CodigoMarca) not null,
)

create table Agencia(
	CodigoAgencia int primary key identity,
	Nome varchar(50) not null,
	Cidade varchar(50) not null,
	Estado varchar(50) not null
)


create table AgenciaModeloDisponivel(
	CodigoAgenciaModeloDisponivel int primary key identity not null,
	CodigoAgencia int foreign key references Agencia(CodigoAgencia) not null,
	CodigoModelo int foreign key references Modelo(CodigoModelo) not null,
	Placa varchar(7) not null,
	DataHoraEntradaAgencia date not null
)

create table Locacao(
	CodigoLocacao int primary key identity not null,
	DataHoraPedido date not null,
	CodigoCliente int foreign key references Cliente(CodigoCliente) not null, 
	DataInicioLocacao date not null,
	CodigoAgenciaModeloDisponivelRetirada int foreign key references AgenciaModeloDisponivel(CodigoAgenciaModeloDisponivel) not null,
	QtdDiasAluguel tinyint not null,
	CodigoAgenciaDevolucao date not null,
	DataDevolucaoEfetiva date
)