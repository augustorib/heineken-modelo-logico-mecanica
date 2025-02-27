-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `heineken-mecanica` DEFAULT CHARACTER SET utf8 ;
USE `heineken-mecanica` ;

-- -----------------------------------------------------
-- Table Cliente
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Cliente (
  idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nomeInicial VARCHAR(45) NOT NULL,
  nomeDoMeio VARCHAR(45) NULL,
  nomeFinal VARCHAR(45) NULL,
  cpf CHAR(11) NOT NULL,
  dataNascimento DATE NOT NULL,
  CONSTRAINT unique_cpf UNIQUE (cpf)
);


-- -----------------------------------------------------
-- Table Mecanico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Mecanico (
  idMecanico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  codigo CHAR(20) NOT NULL,
  endereco VARCHAR(45) NULL,
  especialidade VARCHAR(45) NOT NULL,
  nomeInicial VARCHAR(45) NOT NULL,
  nomeDoMeio VARCHAR(45) NOT NULL,
  CONSTRAINT unique_codigo UNIQUE (codigo)
);


-- -----------------------------------------------------
-- Table EquipeMecanicos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS EquipeMecanicos (
  idEquipeMecanicos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(45) NULL
);


-- -----------------------------------------------------
-- Table Mecanico_EquipeMecanicos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Mecanico_EquipeMecanicos (
  idEquipeMecanicos INT NOT NULL ,
  idMecanico INT NOT NULL,
  PRIMARY KEY (idEquipeMecanicos, idMecanico),
  CONSTRAINT fk_EquipeMecanicos FOREIGN KEY (idEquipeMecanicos) REFERENCES EquipeMecanicos (idEquipeMecanicos) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_Mecanico FOREIGN KEY (idMecanico) REFERENCES Mecanico (idMecanico) ON DELETE NO ACTION ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Table Veiculo
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Veiculo (
  idVeiculo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idCliente INT NOT NULL,
  placa CHAR(7) NOT NULL,
  modelo VARCHAR(45) NULL,
  idEquipeMecanicos INT NOT NULL,
  CONSTRAINT unique_placa UNIQUE (placa),
  CONSTRAINT fk_Veiculo_Cliente FOREIGN KEY (idCliente) REFERENCES Cliente (idCliente) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_Veiculo_EquipeMecanicos1 FOREIGN KEY (idEquipeMecanicos) REFERENCES EquipeMecanicos (idEquipeMecanicos) ON DELETE NO ACTION ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Table OrdemServico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS OrdemServico (
  idOrdemServico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  dataEntrega DATE NOT NULL,
  idEquipeMecanicos INT NOT NULL,
  valorOrdemServiço FLOAT NOT NULL,
  autorizada BIT NULL DEFAULT 0,
  dataEmissao DATE NOT NULL,
  numero BIGINT NOT NULL,
  CONSTRAINT fk_OrdemServico_EquipeMecanicos1 FOREIGN KEY (idEquipeMecanicos) REFERENCES EquipeMecanicos (idEquipeMecanicos) ON DELETE NO ACTION ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Table Servico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Servico (
  idServico INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(45) NULL,
  tipo ENUM("Revisão", "Conserto") NOT NULL,
  codigo CHAR(15) NOT NULL
);


-- -----------------------------------------------------
-- Table Peca
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Peca (
  idPeca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  descricao VARCHAR(45) NOT NULL,
  valorPeca FLOAT NOT NULL,
  tipo ENUM("Elétrica", "Mecânica", "Outros") NOT NULL
);


-- -----------------------------------------------------
-- Table Peca_OrdemServico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Peca_OrdemServico (
  idPeca INT NOT NULL,
  idOrdemServico INT NOT NULL,
  quantidade INT NOT NULL,
  PRIMARY KEY (idPeca, idOrdemServico),
  CONSTRAINT fk_Peça_has_OrdemServico_Peça1 FOREIGN KEY (idPeca) REFERENCES Peca (idPeca) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_Peça_has_OrdemServico_OrdemServico1 FOREIGN KEY (idOrdemServico) REFERENCES OrdemServico (idOrdemServico) ON DELETE NO ACTION ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Table Servico_OrdemServico
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Servico_OrdemServico (
  idServico INT NOT NULL,
  idOrdemServico INT NOT NULL,
  dataOperacao DATE NOT NULL,
  PRIMARY KEY (idServico, idOrdemServico),
  CONSTRAINT fk_Servico_has_OrdemServico_Servico1 FOREIGN KEY (idServico) REFERENCES Servico (idServico) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT fk_Servico_has_OrdemServico_OrdemServico1 FOREIGN KEY (idOrdemServico) REFERENCES OrdemServico (idOrdemServico) ON DELETE NO ACTION ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Table MaoDeObra
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS MaoDeObra (
  idMaoDeObra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idServico INT NOT NULL,
  valor FLOAT NOT NULL,
  CONSTRAINT fk_MaoDeObra_Servico1 FOREIGN KEY (idServico) REFERENCES Servico (idServico) ON DELETE NO ACTION ON UPDATE NO ACTION
);

