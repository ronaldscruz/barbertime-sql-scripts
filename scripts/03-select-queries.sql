-- 1) Listar próximos agendamentos com dados do cliente, barbeiro e serviço
-- Demonstra: SELECT + JOIN + WHERE + ORDER BY + LIMIT
SELECT
    a.id_agendamento,
    c.nome      AS nome_cliente,
    b.nome      AS nome_barbeiro,
    s.nome      AS servico,
    h.data,
    h.hora,
    a.status
FROM agendamento a
JOIN cliente  c ON c.id_cliente  = a.id_cliente
JOIN servico  s ON s.id_servico  = a.id_servico
JOIN horario  h ON h.id_horario  = a.id_horario
JOIN barbeiro b ON b.id_barbeiro = h.id_barbeiro
WHERE h.data >= CURRENT_DATE
ORDER BY h.data, h.hora
LIMIT 10;


-- 2) Relatório simples de atendimentos por barbeiro, com total faturado
-- Demonstra: SELECT + JOIN + GROUP BY + ORDER BY
SELECT
    b.nome                          AS barbeiro,
    COUNT(atd.id_atendimento)       AS qtd_atendimentos,
    SUM(atd.valor_cobrado)          AS total_faturado
FROM atendimento atd
JOIN agendamento a  ON a.id_agendamento = atd.id_agendamento
JOIN horario h      ON h.id_horario     = a.id_horario
JOIN barbeiro b     ON b.id_barbeiro    = h.id_barbeiro
GROUP BY b.nome
ORDER BY total_faturado DESC;
