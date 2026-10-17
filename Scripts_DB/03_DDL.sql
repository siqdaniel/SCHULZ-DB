-- ============================================================================

-- SCRIPT DDL DE CRIAÇÃO DAS TABELAS E POVOAMENTO INICIAL DE TESTE
-- ============================================================================

-- Habilitar o suporte rigoroso a Chaves Estrangeiras (FK) no SQLite
PRAGMA foreign_keys = ON;

-- Limpeza preventiva de tabelas existentes (execução idempotente)
DROP TABLE IF EXISTS tb_medicao;
DROP TABLE IF EXISTS tb_equipamento;
DROP TABLE IF EXISTS tb_tecnico;

-- ============================================================================
-- 1. TABELA: tb_tecnico
-- Armazena o cadastro dos técnicos, metrologistas e signatários autorizados.
-- ============================================================================
CREATE TABLE tb_tecnico (
    id_tecnico INTEGER PRIMARY KEY AUTOINCREMENT,
    nm_tecnico TEXT NOT NULL,
    ds_cargo TEXT,
    ds_setor_solicitante TEXT,
    fl_signatario_autorizado INTEGER NOT NULL DEFAULT 1 CHECK (fl_signatario_autorizado IN (0, 1))
);

-- ============================================================================
-- 2. TABELA: tb_equipamento
-- Armazena o cadastro dos dispositivos de controle e instrumentos de medição.
-- ============================================================================
CREATE TABLE tb_equipamento (
    id_equipamento INTEGER PRIMARY KEY AUTOINCREMENT,
    cd_equipamento TEXT NOT NULL UNIQUE,
    nm_denominacao TEXT NOT NULL,
    nm_fabricante TEXT DEFAULT 'Não consta',
    vlr_nominal_geral REAL,
    ds_localizacao TEXT
);

-- ============================================================================
-- 3. TABELA: tb_medicao
-- Tabela principal que armazena os certificados, parâmetros medidos e leituras.
-- Conecta-se com tb_equipamento e tb_tecnico via Chaves Estrangeiras (FK).
-- ============================================================================
CREATE TABLE tb_medicao (
    id_medicao INTEGER PRIMARY KEY AUTOINCREMENT,
    id_equipamento INTEGER NOT NULL,
    id_tecnico INTEGER NOT NULL,
    nr_certificado TEXT NOT NULL,
    nr_os TEXT NOT NULL,
    dt_calibracao TEXT NOT NULL, -- Padrão ISO YYYY-MM-DD
    nm_parametro TEXT NOT NULL,
    vlr_nominal REAL NOT NULL,
    tol_superior REAL NOT NULL,
    tol_inferior REAL NOT NULL,
    vlr_obtido REAL NOT NULL,
    vlr_erro REAL NOT NULL,
    vlr_incerteza_exp REAL NOT NULL DEFAULT 0.002,
    ds_status TEXT NOT NULL CHECK (ds_status IN ('APROVADO', 'REPROVADO')),
    
    -- Definição de Chaves Estrangeiras (FK) com Integridade Referencial
    CONSTRAINT fk_medicao_equipamento 
        FOREIGN KEY (id_equipamento) 
        REFERENCES tb_equipamento (id_equipamento) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE,
        
    CONSTRAINT fk_medicao_tecnico 
        FOREIGN KEY (id_tecnico) 
        REFERENCES tb_tecnico (id_tecnico) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);

-- ============================================================================
-- CRIAÇÃO DE ÍNDICES PARA OTIMIZAÇÃO DE DESEMPENHO EM CONSULTAS RECORRENTES
-- ============================================================================
CREATE INDEX idx_medicao_equipamento ON tb_medicao(id_equipamento);
CREATE INDEX idx_medicao_tecnico ON tb_medicao(id_tecnico);
CREATE INDEX idx_medicao_certificado ON tb_medicao(nr_certificado);
CREATE INDEX idx_medicao_dt_calibracao ON tb_medicao(dt_calibracao);

-- ===========