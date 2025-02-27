-- 1) Quais são os nomes completos e CPFs dos clientes cadastrados na oficina?
SELECT 
	concat( C.nomeInicial, " ", C.nomeDoMeio, " ", C.nomeFinal) AS Cliente_Nome_Completo,
    C.cpf
FROM 
	CLIENTE C
ORDER BY
	C.nomeInicial;
    
-- 2) Qual a idade de cada cliente ?
SELECT 
	concat( C.nomeInicial, " ", C.nomeDoMeio, " ", C.nomeFinal) AS Cliente_Nome_Completo,
    (YEAR(CURDATE()) - YEAR(dataNascimento)) AS Idade
FROM
	CLIENTE C;
    
-- 3) Qual a quantidade de clientes que tem idade maior que 40 anos?
SELECT 
	count(C.idCliente) as Quantidade
FROM 
	Cliente C
WHERE
	(YEAR(CURDATE()) - YEAR(dataNascimento)) > 40;
    
-- 4) Existe alguma equipe sem mecânico?
SELECT 
	E.descricao AS Equipe_Sem_mecanicos
FROM 
	EquipeMecanicos E
    LEFT JOIN Mecanico_EquipeMecanicos ME ON E.idEquipeMecanicos = ME.idEquipeMecanicos
    LEFT JOIN Mecanico M ON M.idMecanico = ME.idMecanico
WHERE
	ME.idEquipeMecanicos is null;
    
-- 5) Qual o tipo de Serviço foi realizado mais de 1 vez ?
SELECT
	S.tipo,
    Count(S.idServico) AS Total
FROM 
	OrdemServico OS
    NATURAL JOIN Servico_OrdemServico SOS 
    NATURAL JOIN Servico S 
GROUP BY 
	S.tipo
HAVING
	Count(S.idServico) > 1;

-- 6) Qual a equipe que elaborou a ordem de servico mais cara?
SELECT
	E.descricao,
	OS.ValorOrdemServiço
FROM 
	EquipeMecanicos E
	NATURAL JOIN OrdemServico OS
WHERE
	OS.ValorOrdemServiço = (Select MAX(OrdemServico.ValorOrdemServiço) FROM OrdemServico );
    
-- 7) Quais peças foram utilizadas em cada ordem de serviço, sua qunatidade e seus valores totais?
SELECT
	P.descricao, 
    P.tipo, 
    Case POS.idOrdemServico
    when 1 then "OS00001" 
    when 2 then "OS00002" 
    when 3 then "OS00003"
    when 4 then "OS00004"
    else "OS-------"
    END AS OS_Codigo,
    POS.quantidade, 
    concat("R$ ", Round(P.valorPeca,2)) as valor_unitario,
    concat("R$ ", Round((P.valorPeca * POS.Quantidade),2)) as valor_total_pecas
FROM 
	PECA P 
    NATURAL JOIN PECA_ORDEMSERVICO POS;
    
-- 8) Qual o valor da mão de obra dos serviços, do mais barato ao mais caro?
SELECT 
	S.DESCRICAO, concat("R$ ", MDO.VALOR) VALOR
FROM
	SERVICO S
    NATURAL JOIN MAODEOBRA MDO 
ORDER BY 
	MDO.VALOR ASC;
    
    
    



	
    
    
    
    
    
    
    
    
    
    
    
    