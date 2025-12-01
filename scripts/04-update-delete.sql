-- 1) Cancelar um agendamento específico (ex.: id 3) e liberar o horário

UPDATE agendamento
SET status = 'Cancelado'
WHERE id_agendamento = 3;

UPDATE horario
SET disponivel = TRUE
WHERE id_horario = (
    SELECT id_horario
    FROM agendamento
    WHERE id_agendamento = 3
);


-- 2) Corrigir o telefone de um cliente

UPDATE cliente
SET telefone = '(11) 90000-0003'
WHERE id_cliente = 3;


-- 3) Remover um atendimento registrado por engano (ex.: id 2)

DELETE FROM atendimento
WHERE id_atendimento = 2;
