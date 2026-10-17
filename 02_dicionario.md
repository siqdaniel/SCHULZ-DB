# Dicionário de Dados do Sistema - Schulz S.A.

Este documento apresenta o Dicionário de Dados unificado do banco de dados relacional (SQLite) para o sistema de calibração de dispositivos de controle da Schulz S.A.

O mapeamento engloba os campos extraídos das planilhas operacionais, relatórios do software de medição por coordenadas (Zeiss Calypso) e modelo do Certificado de Calibração, padronizando nomenclaturas, tipos de dados do SGBD e restrições de integridade.

## Tabela de Mapeamento de Campos

| Item | Nome do Campo (Atributo) | Entidade / Tabela | Tipo de Dado (SQLite) | Requisito / Restrição | Descrição / Finalidade | Exemplo de Dado |
| :---: | :--- | :--- | :--- | :--- | :--- | :--- |
| **1** | `id_tecnico` | `tb_tecnico` | Inteiro (`INTEGER`) | `PRIMARY KEY`, `AUTOINCREMENT` | Identificador único do técnico/signatário no banco de dados. | `1` |
| **2** | `nm_tecnico` | `tb_tecnico` | Texto (`TEXT`) | `NOT NULL` | Nome completo do técnico executante ou signatário autorizado. | `Jose Alcides Rosa Junior` |
| **3** | `ds_setor_solicitante` | `tb_tecnico` | Texto (`TEXT`) | `NULLABLE` | Setor ou unidade da empresa que solicitou o ensaio de calibração. | `Usinagem I` |
| **4** | `id_equipamento` | `tb_equipamento` | Inteiro (`INTEGER`) | `PRIMARY KEY`, `AUTOINCREMENT` | Identificador único interno do equipamento/dispositivo de controle. | `101` |
| **5** | `cd_equipamento` | `tb_equipamento` | Texto (`TEXT`) | `NOT NULL`, `UNIQUE` | Código de patrimônio / TAG do dispositivo impresso no ativo físico. | `703.1208` |
| **6** | `nm_denominacao` | `tb_equipamento` | Texto (`TEXT`) | `NOT NULL` | Descrição funcional e nomenclatura do instrumento calibrado. | `Dispositivo de controle` |
| **7** | `nm_fabricante` | `tb_equipamento` | Texto (`TEXT`) | `NULLABLE` | Nome da empresa fabricante do equipamento ou indicação de ausência. | `Não consta` |
| **8** | `id_medicao` | `tb_medicao` | Inteiro (`INTEGER`) | `PRIMARY KEY`, `AUTOINCREMENT` | Identificador único do registro individual de medição do parâmetro. | `5001` |
| **9** | `nr_certificado` | `tb_medicao` | Texto (`TEXT`) | `NOT NULL` | Número oficial de identificação do Certificado de Calibração emitido. | `00091/2026` |
| **10** | `nr_os` | `tb_medicao` | Texto (`TEXT`) | `NOT NULL` | Número da Ordem de Serviço que originou o atendimento metrológico. | `OS-2026-8812` |
| **11** | `dt_calibracao` | `tb_medicao` | Texto (`TEXT`) | `NOT NULL` | Data exata da realização da calibração (padrão ISO YYYY-MM-DD). | `2026-08-26` |
| **12** | `nm_parametro` | `tb_medicao` | Texto (`TEXT`) | `NOT NULL` | Nome ou característica geométrica sob análise de medição. | `62P_DIAMETRO 1` |
| **13** |