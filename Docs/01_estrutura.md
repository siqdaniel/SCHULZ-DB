# Organização dos Dados e Modelagem Conceitual Simplificada

## 1. Visão Geral do Banco de Dados Relacional (SQLite)

O presente documento descreve a arquitetura e a organização estrutural do banco de dados relacional desenvolvido para a **Schulz S.A.**, em substituição ao modelo legado baseado no preenchimento e leitura estática de planilhas eletrônicas (Excel).

A migração para um Sistema Gerenciador de Banco de Dados Relacional em **SQLite** tem como objetivo central garantir:
- **Integridade referencial**
- **Rastreabilidade metrológica**
- **Armazenamento do histórico de calibrações**
- **Segurança das informações operacionais**

A estrutura foi projetada para eliminar falhas decorrentes de digitação manual, descontinuidade de equações estatísticas e geração de dados corrompidos (como marcadores `NaN`), atendendo aos requisitos das normas internacionais de qualidade **ISO 9001** e **IATF 16949**.

---

## 2. Divisão em Entidades Principais

Para assegurar a correta normalização até a **Terceira Forma Normal (3FN)**, a estrutura do banco de dados foi modelada e dividida em três entidades fundamentais:

```text
[tb_tecnico] (1) <--- realiza ---> (N) [tb_medicao] (N) <--- avalia ---> (1) [tb_equipamento] 
```

### 2.1. Entidade `tb_tecnico` (Técnico / Solicitante / Signatário)

- **Objetivo:** Armazenar os dados cadastrais do pessoal técnico responsável pela execução física dos ensaios de calibração, pela aprovação do laudo e pela sinalização dos setores solicitantes (ex.: *Usinagem I*, *CDM*, *Metrologia*).
- **Atributos Principais:**
  - `id_tecnico` (PK)
  - `nm_tecnico`
  - `ds_cargo`
  - `ds_setor_solicitante`
  - `fl_signatario_autorizado`
- **Papel no Sistema:** Associa a responsabilidade técnica do laudo emitido a um operador ou signatário homologado, impedindo a digitação livre de nomes e garantindo o rastreamento em auditorias de qualidade.

---

### 2.2. Entidade `tb_equipamento` (Equipamento / Dispositivo de Controle)

- **Objetivo:** Armazenar os metadados cadastrais dos instrumentos e dispositivos de controle que passam pelo laboratório de metrologia para validação física.
- **Atributos Principais:**
  - `id_equipamento` (PK)
  - `cd_equipamento` (TAG/Código)
  - `nm_denominacao`
  - `nm_fabricante`
  - `vlr_nominal_geral`
  - `ds_localizacao`
- **Papel no Sistema:** Mantém o registro único do ativo fabril no chão de fábrica da Schulz S.A. As informações cadastrais do dispositivo permanecem centralizadas, evitando que metadados do equipamento sejam redigitados a cada nova calibração realizada.

---

### 2.3. Entidade `tb_medicao` (Registro da Calibração e Parâmetros Medidos)

- **Objetivo:** Registrar as instâncias de calibração (laudos/certificados) e armazenar individualmente as cotas, características geométricas e resultados das medições obtidas pelas Máquinas de Medição por Coordenadas (MMC Carl Zeiss).
- **Atributos Principais:**
  - `id_medicao` (PK)
  - `id_equipamento` (FK)
  - `id_tecnico` (FK)
  - `nr_certificado`
  - `nr_os`
  - `dt_calibração`
  - `nm_parametro`
  - `vlr_nominal`
  - `tol_superior`
  - `tol_inferior`
  - `vlr_obtido`
  - `vlr_erro`
  - `vlr_incerteza_exp`
  - `ds_status_aprovacao`
- **Papel no Sistema:** Atua como a entidade central que conecta o instrumento testado e o técnico executante aos resultados analíticos de medição, retendo todo o histórico de calibrações executadas ao longo do tempo.

---

## 3. Justificativa Técnica: A Importância de Evitar Dados Duplicados

No cenário legado, centrado em planilhas eletrônicas desconectadas, identificaram-se severas redundâncias e anomalias de dados:

1. **Redundância Cadastral:** Metadados do equipamento (como TAG, fabricante e descrição) eram replicados manualmente em cada nova planilha criada.
2. **Duplicação de Leituras:** Arquivos brutos gerados pelos softwares de medição (ex.: Zeiss Calypso) apresentavam blocos idênticos de leituras repetidas em lote.
3. **Inconsistências Tipográficas e Nulos:** Modificações pontuais em dados do técnico ou do instrumento geravam divergências de grafia (ex.: `José A. Rosa Jr.` vs `Jose Alcides Rosa Junior`) e a proliferação de linhas vazias com erro `NaN`.

### Benefícios da Eliminação de Redundâncias no Modelo Relacional

- **Integridade Referencial:** Com o uso de Chaves Primárias (PK) e Chaves Estrangeiras (FK), garante-se que uma medição só exista associada a um equipamento e a um técnico previamente validados.
- **Consistência de Dados e Atualização Centralizada:** Alterações nos dados cadastrais de um dispositivo ou técnico são realizadas em um único registro na tabela pai (`tb_equipamento` ou `tb_tecnico`), refletindo-se automaticamente em todas as medições associadas sem risco de divergência.
- **Economia de Armazenamento e Desempenho:** A eliminação de duplicações reduz significativamente o tamanho do arquivo do banco de dados SQLite, otimizando a velocidade de execução das consultas SQL e a geração de relatórios.
- **Conformidade para Auditorias (ISO 9001 / IATF 16949):** A centralização dos registros assegura a rastreabilidade metrológica absoluta. Impede-se a alteração inadvertida do histórico e garante-se que cada certificado emitido corresponda exatamente às especificações de tolerância e incerteza homologadas.
```