-- --------------------------------------
-- Seed tabelas 'heineken-mecanica'
-- --------------------------------------

-- Populando a tabela Cliente
INSERT INTO Cliente (nomeInicial, nomeDoMeio, nomeFinal, cpf, dataNascimento) VALUES
('Carlos', 'Eduardo', 'Silva', '12345678901', '1985-04-12'),
('Mariana', 'Aparecida', 'Souza', '23456789012', '1990-06-23'),
('Ricardo', 'Augusto', 'Ferreira', '34567890123', '1978-09-15'),
('Fernanda', 'Cristina', 'Mendes', '45678901234', '1982-12-30'),
('João', 'Pedro', 'Alves', '56789012345', '1995-03-10'),
('Ana', 'Beatriz', 'Oliveira', '67890123456', '1987-07-19'),
('Bruno', 'Henrique', 'Santos', '78901234567', '1993-11-02'),
('Patricia', 'Fernanda', 'Lima', '89012345678', '1980-05-25');

-- Populando a tabela Mecanico
INSERT INTO Mecanico (codigo, endereco, especialidade, nomeInicial, nomeDoMeio) VALUES
('MECH001', 'Rua A, 100', 'Suspensão', 'Paulo', 'Roberto'),
('MECH002', 'Rua B, 200', 'Freios', 'Juliano', 'Martins'),
('MECH003', 'Rua C, 300', 'Motor', 'Sergio', 'Gomes'),
('MECH004', 'Rua D, 400', 'Transmissão', 'Roberto', 'Dias'),
('MECH005', 'Rua E, 500', 'Elétrica', 'Marcos', 'Silveira'),
('MECH006', 'Rua F, 600', 'Pintura', 'Lucas', 'Almeida'),
('MECH007', 'Rua G, 700', 'Direção', 'Vinicius', 'Barbosa'),
('MECH008', 'Rua H, 800', 'Troca de óleo', 'Adriano', 'Castro');

-- Populando a tabela EquipeMecanicos
INSERT INTO EquipeMecanicos (descricao) VALUES
('Equipe Alfa'), 
('Equipe Beta'),
('Equipe Gama'),
('Equipe Delta'),
('Equipe Omega');

-- Populando a tabela Mecanico_EquipeMecanicos
INSERT INTO Mecanico_EquipeMecanicos (idEquipeMecanicos, idMecanico) VALUES
(1, 1),
(1, 2), 
(2, 3), 
(2, 4), 
(3, 5), 
(3, 6), 
(4, 7), 
(4, 8);

-- Populando a tabela Veiculo
INSERT INTO Veiculo (idCliente, placa, modelo, idEquipeMecanicos) VALUES
(1, 'ABC1234', 'Honda Civic', 1),
(2, 'XYZ5678', 'Toyota Corolla', 2),
(3, 'DEF9012', 'Ford Focus', 3),
(4, 'GHI3456', 'Volkswagen Golf', 4),
(5, 'JKL7890', 'Chevrolet Onix', 1),
(6, 'MNO2345', 'Fiat Argo', 2),
(7, 'PQR6789', 'Renault Sandero', 3),
(8, 'STU0123', 'Hyundai HB20', 4);

-- Populando a tabela OrdemServico
INSERT INTO OrdemServico (dataEntrega, idEquipeMecanicos, valorOrdemServiço, autorizada, dataEmissao, numero) VALUES
('2025-03-01', 1, 1200.50, 1, '2025-02-20', 1001),
('2025-03-02', 2, 850.00, 0, '2025-02-21', 1002),
('2025-03-03', 3, 3000.75, 1, '2025-02-22', 1003),
('2025-03-04', 4, 1500.25, 1, '2025-02-23', 1004);

-- Populando a tabela Servico
INSERT INTO Servico (descricao, tipo, codigo) VALUES
('Troca de óleo', 'Revisão', 'REV001'),
('Alinhamento e balanceamento', 'Revisão', 'REV002'),
('Troca de pastilhas de freio', 'Conserto', 'SERV003'),
('Substituição de bateria', 'Conserto', 'SERV004');

-- Populando a tabela Peca
INSERT INTO Peca (descricao, valorPeca, tipo) VALUES
('Óleo sintético 5W30', 50.00, 'Outros'),
('Pastilhas de freio dianteiras', 200.00, 'Mecânica'),
('Bateria 60Ah', 350.00, 'Elétrica'),
('Filtro de ar', 80.00, 'Mecânica');

-- Populando a tabela Peca_OrdemServico
INSERT INTO Peca_OrdemServico (idPeca, idOrdemServico, quantidade) VALUES 
(1, 1, 2), 
(2, 2, 1), 
(3, 3, 1), 
(4, 4, 1);

-- Populando a tabela Servico_OrdemServico
INSERT INTO Servico_OrdemServico (idServico, idOrdemServico, dataOperacao) VALUES
(1, 1, '2025-02-22'), 
(2, 2, '2025-02-23'),
(3, 3, '2025-02-24'), 
(4, 4, '2025-02-25');

-- Populando a tabela MaoDeObra
INSERT INTO MaoDeObra (idServico, valor) VALUES
(1, 100.00), 
(2, 150.00), 
(3, 200.00), 
(4, 250.00);
