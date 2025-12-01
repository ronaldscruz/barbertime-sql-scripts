-- Criação do banco de dados (opcional)
-- CREATE DATABASE barbertime;
-- \c barbertime;

-- Remoção das tabelas, caso já existam (para facilitar testes)
DROP TABLE IF EXISTS atendimento CASCADE;
DROP TABLE IF EXISTS agendamento CASCADE;
DROP TABLE IF EXISTS horario CASCADE;
DROP TABLE IF EXISTS servico CASCADE;
DROP TABLE IF EXISTS barbeiro CASCADE;
DROP TABLE IF EXISTS cliente CASCADE;

-- =========================
-- Tabela: Cliente
-- =========================
CREATE TABLE cliente (
    id_cliente       SERIAL PRIMARY KEY,
    nome             VARCHAR(100) NOT NULL,
    email            VARCHAR(150) UNIQUE NOT NULL,
    telefone         VARCHAR(20),
    data_nascimento  DATE
);

-- =========================
-- Tabela: Barbeiro
-- =========================
CREATE TABLE barbeiro (
    id_barbeiro      SERIAL PRIMARY KEY,
    nome             VARCHAR(100) NOT NULL,
    email            VARCHAR(150) UNIQUE NOT NULL,
    data_nascimento  DATE
);

-- =========================
-- Tabela: Servico
-- =========================
CREATE TABLE servico (
    id_servico       SERIAL PRIMARY KEY,
    nome             VARCHAR(100) NOT NULL,
    preco            NUMERIC(10,2) NOT NULL,
    duracao_minutos  INT NOT NULL
);

-- =========================
-- Tabela: Horario
-- =========================
CREATE TABLE horario (
    id_horario   SERIAL PRIMARY KEY,
    data         DATE NOT NULL,
    hora         TIME NOT NULL,
    disponivel   BOOLEAN NOT NULL DEFAULT TRUE,
    id_barbeiro  INT NOT NULL,
    CONSTRAINT fk_horario_barbeiro
        FOREIGN KEY (id_barbeiro) REFERENCES barbeiro (id_barbeiro)
);

-- =========================
-- Tabela: Agendamento
-- =========================
CREATE TABLE agendamento (
    id_agendamento  SERIAL PRIMARY KEY,
    status          VARCHAR(20) NOT NULL,  -- ex.: 'Agendado', 'Cancelado'
    id_cliente      INT NOT NULL,
    id_servico      INT NOT NULL,
    id_horario      INT NOT NULL UNIQUE,
    CONSTRAINT fk_agendamento_cliente
        FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    CONSTRAINT fk_agendamento_servico
        FOREIGN KEY (id_servico) REFERENCES servico (id_servico),
    CONSTRAINT fk_agendamento_horario
        FOREIGN KEY (id_horario) REFERENCES horario (id_horario)
);

-- =========================
-- Tabela: Atendimento
-- =========================
CREATE TABLE atendimento (
    id_atendimento   SERIAL PRIMARY KEY,
    data_realizacao  DATE NOT NULL,
    observacao       TEXT,
    valor_cobrado    NUMERIC(10,2) NOT NULL,
    id_agendamento   INT NOT NULL UNIQUE,
    CONSTRAINT fk_atendimento_agendamento
        FOREIGN KEY (id_agendamento) REFERENCES agendamento (id_agendamento)
);
