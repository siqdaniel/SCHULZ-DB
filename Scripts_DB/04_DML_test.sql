

-- ============================================================================
-- INSERÇÃO DE DADOS DE TESTE (Baseado no Certificado nº 00091/2026 - Schulz S.A.)
-- ============================================================================

-- Inserção de Técnico executante / Signatário Autorizado
INSERT INTO tb_tecnico (id_tecnico, nm_tecnico, ds_cargo, ds_setor_solicitante, fl_signatario_autorizado)
VALUES (1, 'Jose Alcides Rosa Junior', 'Técnico Metrologista', 'Usinagem I', 1);

INSERT INTO tb_tecnico (id_tecnico, nm_tecnico, ds_cargo, ds_setor_solicitante, fl_signatario_autorizado)
VALUES (2, 'João Carlos Gomes de Oliveira', 'Signatário Autorizado', 'Metrologia Central', 1);

-- Inserção do Equipamento / Dispositivo de Controle
INSERT INTO tb_equipamento (id_equipamento, cd_equipamento, nm_denominacao, nm_fabricante, vlr_nominal_geral, ds_localizacao)
VALUES (101, '703.1208', 'Dispositivo de controle', 'Não consta', 0.000, 'Usinagem I');

-- Inserção das Medições e Parâmetros extraídos do Certificado Oficial
INSERT INTO tb_medicao (id_equipamento, id_tecnico, nr_certificado, nr_os, dt_calibracao, nm_parametro, vlr_nominal, tol_superior, tol_inferior, vlr_obtido, vlr_erro, vlr_incerteza_exp, ds_status)
VALUES
(101, 1, '00091/2026', 'OS-2026-8812', '2026-08-26', 'PLANICIDADE_REF', 0.000, 0.050, 0.000, 0.002, 0.002, 0.002, 'APROVADO'),
(101, 1, '00091/2026', 'OS-2026-8812', '2026-08-26', 'ENTRE CENTROS REF', 0.000, 0.040, 0.000, 0.027, 0.027, 0.002, 'APROVADO'),
(101, 1, '00091/2026', 'OS-2026-8812', '2026-08-26', '62P_DIAMETRO 1', 6.075, 0.010, -0.010, 6.079, 0.004, 0.002, 'APROVADO'),
(101, 1, '00091/2026', 'OS-2026-8812', '2026-08-26', '62P_POSIÇÃO 1', 0.000, 0.100, 0.000, 0.430, 0.430, 0.002, 'REPROVADO'),
(101, 1, '00091/2026', 'OS-2026-8812', '2026-08-26', '62P_DIAMETRO 2', 6.075, 0.010, -0.010, 6.078, 0.003, 0.002, 'APROVADO'),
(101, 1, '00091/2026', 'OS-2026-8812', '2026-08-26', '62P_POSIÇÃO 2', 0.000, 0.100, 0.000, 0.245, 0.245, 0.002, 'REPROVADO'),
(101, 1, '00091/2026', 'OS-2026-8812', '2026-08-26', '13P DIAMETRO 1', 16.964, 0.010, -0.010, 16.968, 0.004, 0.002, 'APROVADO'),
(101, 1, '00091/2026', 'OS-2026-8812', '2026-08-26', '13P_POSIÇÃO 1', 0.000, 0.100, 0.000, 0.959, 0.959, 0.002, 'REPROVADO'),
(101, 1, '00091/2026', 'OS-2026-8812', '2026-08-26', '13P DIAMETRO 2', 16.964, 0.010, -0.010, 16.970, 0.006, 0.002, 'APROVADO'),
(101, 1, '00091/2026', 'OS-2026-8812', '2026-08-26', '13P_POSIÇÃO 2', 0.000, 0.100, 0.000, 0.236, 0.236, 0.002, 'REPROVADO'),
(101, 1, '00091/2026', 'OS-2026-8812', '2026-08-26', '106P_DIAMETRO 1', 6.345, 0.010, -0.010, 6.346, 0.001, 0.002, 'APROVADO'),
(101, 1, '00091/2026', 'OS-2026-8812', '2026-08-26', '106P_POSIÇÃO 1', 0.000, 0.100, 0.000, 0.132, 0.132, 0.002, 'REPROVADO'),
(101, 1, '00091/2026', 'OS-2026-8812', '2026-08-26', '106P_DIAMETRO 2', 6.345, 0.010, -0.010, 6.349, 0.004, 0.002, 'APROVADO'),
(101, 1, '00091/2026', 'OS-2026-8812', '2026-08-26', '106P_POSIÇÃO 2', 0.000, 0.100, 0.000, 0.130, 0.130, 0.002, 'REPROVADO');