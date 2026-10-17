# Projeto Aplicado I — Automação de Certificados de Calibração (Schulz S.A.)

**Unidade Curricular:** Projeto Aplicado I (AEx)  
**Instituição:** UniSENAI  
**Curso:** Superior de Tecnologia em Análise e Desenvolvimento de Sistemas  
**Professor Orientador:** Prof. MSc. Hugo Menezes Barra  
**Empresa Parceira:** Schulz S.A.  

---

##  Equipe de Desenvolvimento

* **Daniel Victor Sampaio Siqueira**
* **Davi Guilherme de Santana Rodovalho**
* **Lisandro Fernandes Mattos Leite**
* **Valtair Werlich**

---

##  Modelagem e Implementação de Banco de Dados

Na **Entrega 01**, mapeamos os requisitos e gargalos causados pela manipulação manual de planilhas eletrônicas no laboratório de metrologia da **Schulz S.A.** (erros do tipo `NaN`, duplicação em lote de medições e inconsistências cronológicas).

Na **Entrega 02**, estruturamos o **Banco de Dados Relacional em SQLite** responsável por armazenar com integridade, segurança e rastreabilidade as informações dos técnicos, equipamentos e medições geométricas. Essa arquitetura substitui a leitura estática de planilhas, preparando o terreno para a geração automatizada de Certificados de Calibração em conformidade com as normas **ISO 9001** e **IATF 16949**.

---

## 📂 Estrutura dos Arquivos do Entregável

```text
.
├── 01_estrutura.md      # Explicação da modelagem conceitual (3FN) e justificativa relacional
├── 02_dicionario.md     # Dicionário de dados mapeando 19 campos extraídos do Calypso/Zeiss
├── 03_banco.sql          # Script DDL executável (SQLite) com PK, FK, CHECKs e carga inicial
└── README.md            # Documentação e instruções do repositório