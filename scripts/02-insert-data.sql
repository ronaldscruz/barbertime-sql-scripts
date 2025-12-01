-- Clientes
INSERT INTO cliente (nome, email, telefone, data_nascimento) VALUES
('João Silva',      'joao.silva@example.com',   '(11) 99999-0001', '1995-03-10'),
('Maria Oliveira',  'maria.oliveira@example.com','(11) 98888-0002', '1988-07-22'),
('Carlos Souza',    'carlos.souza@example.com', '(11) 97777-0003', '2000-01-15');

-- Barbeiros
INSERT INTO barbeiro (nome, email, data_nascimento) VALUES
('Marcos Lima',     'marcos.lima@barbertime.com', '1985-05-05'),
('Ricardo Santos',  'ricardo.santos@barbertime.com', '1990-09-18');

-- Serviços
INSERT INTO servico (nome, preco, duracao_minutos) VALUES
('Corte Masculino', 40.00, 30),
('Barba',           30.00, 20),
('Corte + Barba',   60.00, 45);

-- Horários dos barbeiros
INSERT INTO horario (data, hora, disponivel, id_barbeiro) VALUES
('2025-12-01', '14:00', TRUE, 1),
('2025-12-01', '15:00', TRUE, 1),
('2025-12-01', '16:00', TRUE, 2),
('2025-12-01', '17:00', TRUE, 2);

-- Agendamentos
-- 1) João, Corte Masculino, com Marcos às 14:00
INSERT INTO agendamento (status, id_cliente, id_servico, id_horario) VALUES
('Agendado', 1, 1, 1);

-- 2) Maria, Corte + Barba, com Marcos às 15:00
INSERT INTO agendamento (status, id_cliente, id_servico, id_horario) VALUES
('Agendado', 2, 3, 2);

-- 3) Carlos, Barba, com Ricardo às 16:00 (mais tarde vamos cancelar)
INSERT INTO agendamento (status, id_cliente, id_servico, id_horario) VALUES
('Agendado', 3, 2, 3);

-- Atualiza horários reservados para não disponíveis
UPDATE horario
SET disponivel = FALSE
WHERE id_horario IN (1, 2, 3);

-- Atendimentos (somente para os dois primeiros agendamentos)
INSERT INTO atendimento (data_realizacao, observacao, valor_cobrado, id_agendamento) VALUES
('2025-12-01', 'Cliente pediu acabamento na sobrancelha.', 40.00, 1),
('2025-12-01', 'Cliente satisfeito com o combo.',          60.00, 2);
