-- Solicitado pelo cliente um relatório que informe a quantidade de sorteios cadastrados no sistema.
SELECT COUNT (idsorteio) AS "Quantidade de sorteio no Sistema"
FROM tb_sorteio;


-- Solicitado pelo cliente um relatório de todos os pontos já inseridos (para melhor visualização separamos por CPF de modo descendente a quantidade de pontos). Fizemos uma junção externa a esquerda para puxar todos os pontos de cada cliente da tb_pontos, através da chave PK cpf do cliente e FK cpf pontos.

SELECT c.cpf||' Contém: '||COALESCE (p.quantidadept,0)||' Pontos ' AS "Quantidade de 
Pontos P/CPF"
FROM tb_clientes c 
LEFT OUTER JOIN tb_pontos p ON (c.cpf = p.cpf) 
ORDER BY p.quantidadept DESC ;
 
-- Solicitado pelo cliente um relatório de controle relacionado aos administradores que recém alteraram as promoções. Fizemos uma junção a esquerda para saber qual administrador editou tal promoção através da tb_administradores com chave PK usename de administradores e FK username de cria_edita. Usamos ORDER BY para ordenar em forma decrescente.

SELECT 'O administrador '||a.username||' editou a promoção de id ' ||ce.idpromocao AS 
"Edição de promoção"
FROM tb_administradores a
LEFT OUTER JOIN tb_editar ce on(a.username = ce.username)
ORDER BY ce.idpromocao DESC;

-- Solicitado pelo cliente um relatório analítico que mostre a média de pontos do cliente por cpf. Fizemos uma junção a esquerda para puxar a média de pontos acumulados por cliente através do cpf, com a tb_clientes pegando como chave PK cpf do cliente e FK cpf pontos.

SELECT 'O CPF '||c.cpf ||' Contém em média: '|| AVG (ROUND(p.quantidadept)) AS "Média de 
Ponto"
FROM tb_pontos p 
LEFT OUTER JOIN tb_clientes c ON (c.cpf = p.cpf)
GROUP BY c.cpf
ORDER BY AVG (p.quantidadept) DESC