USE gamerFinal

DROP DATABASE HealthClinicAllan

CREATE DATABASE HealthClinicAllan

USE HealthClinicAllan

CREATE TABLE PerfilUsuario (
	IdPerfilUsuario INT PRIMARY KEY,
	NomePerfilUsuario VARCHAR(20) UNIQUE NOT NULL
)

CREATE TABLE Usuario (
	IdUsuario INT PRIMARY KEY,
	IdPerfilUsuario INT FOREIGN KEY REFERENCES PerfilUsuario(IdPerfilUsuario) NOT NULL,
	NomeUsuario VARCHAR(100) NOT NULL,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(50) NOT NULL,
	DataNascimento DATE 
)

CREATE TABLE Endereco (
	IdEndereco INT PRIMARY KEY,
	CEP VARCHAR(15) NOT NULL,
	Logradouro VARCHAR(50) NOT NULL,
	Numero VARCHAR(10) NOT NULL,
	Complemento VARCHAR(50) NOT NULL,
	Bairro VARCHAR(50) NOT NULL,
	UF VARCHAR(2) NOT NULL
)

CREATE TABLE EnderecoUsuario (
	IdEnderecoTelefone INT PRIMARY KEY,
	IdEndereco INT FOREIGN KEY REFERENCES Endereco(IdEndereco) NOT NULL,
	IdUsuario INT FOREIGN KEY REFERENCES Usuario (IdUsuario) NOT NULL
)

CREATE TABLE Clinica (
	IdClinica INT PRIMARY KEY,
	IdEndereco INT FOREIGN KEY REFERENCES Endereco (IdEndereco) NOT NULL,
	CNPJ VARCHAR (20) NOT NULL,
	RazaoSocial VARCHAR (100) NOT NULL,
	NomeFantasia VARCHAR (100) NOT NULL,
	HorarioAbertura TIME NOT NULL,
	HorarioFechamento TIME NOT NULL
)

CREATE TABLE Telefone (
	IdTelefone INT PRIMARY KEY,
	Numero VARCHAR(20) UNIQUE NOT NULL
)

CREATE TABLE TelefoneClinica (
	IdTelefoneClinica INT PRIMARY KEY,
	IdUsuario INT FOREIGN KEY REFERENCES Usuario (IdUsuario),
	IdTelefone INT FOREIGN KEY REFERENCES Telefone (IdTelefone) 
)

CREATE TABLE TelefoneUsuario (
	IdTelefoneUsuario INT PRIMARY KEY,
	IdUsuario INT FOREIGN KEY REFERENCES Usuario (IdUsuario) NOT NULL,
	IdTelefone INT FOREIGN KEY REFERENCES Telefone (IdTelefone) NOT NULL
)

CREATE TABLE Medico (
	IdMedico INT PRIMARY KEY,
	IdUsuario INT FOREIGN KEY REFERENCES Usuario (IdUsuario) NOT NULL UNIQUE,
	CRM VARCHAR (15) NOT NULL
)

CREATE TABLE ClinicaMedico (
	IdClinicaMedico INT PRIMARY KEY,
	IdMedico INT FOREIGN KEY REFERENCES Medico (IdMedico) NOT NULL,
	IdClinica INT FOREIGN KEY REFERENCES Clinica (IdClinica) NOT NULL
)

CREATE TABLE Especificidade (
	IdEspecificidade INT PRIMARY KEY,
	NomeEspecificidade VARCHAR(50) UNIQUE NOT NULL
)

CREATE TABLE EspecificidadeMedico (
	IdEspecificidadeMedico INT PRIMARY KEY,
	IdEspecificidade INT FOREIGN KEY REFERENCES Especificidade (IdEspecificidade) NOT NULL,
	IdMedico INT FOREIGN KEY REFERENCES Medico (IdMedico) NOT NULL
)

CREATE TABLE Paciente (
	IdPaciente INT PRIMARY KEY,
	IdUsuario INT FOREIGN KEY REFERENCES Paciente (IdUsuario) NOT NULL UNIQUE,
	Convenio VARCHAR (50) NOT NULL
)

CREATE TABLE Consulta (
	IdConsulta INT PRIMARY KEY,
	IdMedico INT FOREIGN KEY REFERENCES Medico (IdMedico) NOT NULL,
	IdPaciente INT FOREIGN KEY REFERENCES Paciente (IdPaciente) NOT NULL,
	DataConsulta DATE NOT NULL,
	HoraConsulta TIME NOT NULL,
	Descricao VARCHAR (2000) NOT NULL
)

CREATE TABLE FeedBack (
	IdFeedBack INT PRIMARY KEY,
	IdConsulta INT FOREIGN KEY REFERENCES Consulta (IdConsulta) UNIQUE NOT NULL,
	IdPaciente INT FOREIGN KEY REFERENCES Paciente (IdPaciente) NOT NULL,
	DataFeedBack DATE NOT NULL,
	Avaliacao VARCHAR (2000) NOT NULL,
	Nota INT NOT NULL DEFAULT 0
)