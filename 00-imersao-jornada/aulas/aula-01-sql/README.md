# Dia 1: SQL & Analytics | Jornada de Dados

Bem-vindo ao **primeiro dia da imersao Jornada de Dados**! Hoje voce vai aprender SQL do zero, pensando como um analista de dados que precisa responder perguntas de negocio.

**Dominio:** Sistema de vendas (e-commerce + loja fisica)
**Conexao:** Cada exemplo SQL prepara voce para conceitos que vai reencontrar na **aula-03-dbt** (arquitetura medalha: bronze, silver, gold).

---

## O que e SQL?

**SQL** (Structured Query Language) e a linguagem padrao para trabalhar com bancos de dados relacionais. E a ferramenta que permite:

- **Consultar dados** - Extrair informacoes de tabelas
- **Analisar dados** - Calcular metricas, agregacoes e estatisticas
- **Manipular dados** - Inserir, atualizar e deletar registros
- **Estruturar dados** - Criar tabelas, relacionamentos e indices

**SQL nao e uma linguagem de programacao tradicional.** E uma linguagem declarativa: voce descreve **o que quer**, nao **como fazer**. O banco de dados decide a melhor forma de executar.

```sql
-- Voce diz: "Quero os produtos mais caros"
SELECT nome_produto, preco_atual
FROM produtos
ORDER BY preco_atual DESC
LIMIT 10;

-- O banco decide como buscar isso de forma eficiente
```

---

## Mercado de SQL

SQL e uma das habilidades mais demandadas no mercado de dados e tecnologia:

### Por que SQL e importante?

1. **Universalidade**: Quase todos os bancos de dados relacionais usam SQL
2. **Demanda de mercado**: Uma das habilidades mais procuradas em vagas de dados
3. **Base para outras ferramentas**: BI tools (Power BI, Tableau), Python (pandas), dbt, etc.
4. **Carreira**: Analista de Dados, Cientista de Dados, Engenheiro de Dados, todos precisam de SQL

### Onde SQL e usado?

- **Analise de Negocio**: Responder perguntas estrategicas
- **Business Intelligence**: Criar dashboards e relatorios
- **Data Science**: Preparar e explorar dados
- **Data Engineering**: Transformar dados com dbt, pipelines ETL/ELT
- **Desenvolvimento**: Backend de aplicacoes

---

## Plataforma: Supabase

Neste curso, vamos usar **[Supabase](https://supabase.com/)** porque:

- **PostgreSQL completo** - Banco de dados profissional e robusto
- **Interface web** - Editor SQL integrado, facil de usar
- **Gratuito** - Plano free generoso para aprender
- **Facil setup** - Criacao de projeto em minutos

**Supabase e essencialmente PostgreSQL com uma interface moderna.** Tudo que voce aprender aqui funciona em qualquer PostgreSQL.

---

## Nossas Tabelas

Nossos dados: https://docs.google.com/spreadsheets/d/1V_ICue9zOznu-8WlCUpb0ZmHEE5NZcqgV1_Gw4RIJp4/edit?usp=sharing

Trabalhamos com 3 tabelas de um sistema de vendas:

```
Banco de Dados: E-commerce
├── vendas     (~3.000 registros) - Transacoes de venda
├── produtos   (200 registros)    - Catalogo de produtos
└── clientes   (50 registros)     - Clientes cadastrados
```

### vendas
| Coluna | Tipo | Descricao |
|--------|------|-----------|
| id_venda | TEXT | ID unico da venda |
| data_venda | TIMESTAMP | Data e hora da venda |
| id_cliente | TEXT | FK para clientes |
| id_produto | TEXT | FK para produtos |
| canal_venda | TEXT | "ecommerce" ou "loja_fisica" |
| quantidade | INTEGER | Unidades vendidas |
| preco_unitario | NUMERIC | Preco unitario na venda |

### produtos
| Coluna | Tipo | Descricao |
|--------|------|-----------|
| id_produto | TEXT | ID unico do produto |
| nome_produto | TEXT | Nome do produto |
| categoria | TEXT | Categoria (Eletronicos, Cozinha, etc.) |
| marca | TEXT | Marca do produto |
| preco_atual | NUMERIC | Preco atual em R$ |
| data_criacao | TIMESTAMP | Data de criacao |

### clientes
| Coluna | Tipo | Descricao |
|--------|------|-----------|
| id_cliente | TEXT | ID unico do cliente |
| nome_cliente | TEXT | Nome do cliente |
| estado | TEXT | Estado (UF) |
| pais | TEXT | Pais |
| data_cadastro | TIMESTAMP | Data de cadastro |

---

## Progressao de Aprendizado

Os 11 exemplos seguem uma progressao didatica onde cada um usa conceitos dos anteriores. Todos focam no dominio **Sales** e preparam para o dbt.

```
SQL Basico           → Transformacoes      → Analises complexas
(exemplos 01-03)       (exemplos 04-06)      (exemplos 07-11)
SELECT, WHERE,         Campos calculados,    JOIN, GROUP BY+JOIN,
ORDER BY, LIMIT        Agregacoes, GROUP BY  CASE WHEN, Window, CTE
```

### Conexao SQL → dbt (Arquitetura Medalha)

| Camada dbt | O que faz | Exemplos SQL relacionados |
|------------|-----------|---------------------------|
| **Bronze** | Views das tabelas raw, sem transformacao | Exemplo 01 (SELECT *) |
| **Silver** | Limpeza, campos calculados, JOINs | Exemplos 04, 07, 09 |
| **Gold** | KPIs, agregacoes, rankings | Exemplos 06, 08, 10, 11 |

---

## Exemplos

### Exemplo 01 - SELECT Basico
**Arquivo:** `exemplo-01-select-basico.sql`
**Conceito:** SELECT para explorar dados brutos
**Pergunta de negocio:** Que dados temos disponiveis no nosso sistema de vendas?
**Conexao dbt:** Camada bronze - views que expoem as tabelas raw sem transformacao

O que voce aprende:
- Sintaxe basica do SELECT
- Conhecer as 3 tabelas (vendas, produtos, clientes)
- Usar LIMIT para limitar resultados

---

### Exemplo 02 - ORDER BY + LIMIT
**Arquivo:** `exemplo-02-order-by-limit.sql`
**Conceito:** Ordenacao e top N
**Pergunta de negocio:** Quais sao os produtos mais caros? Quais as maiores vendas?
**Conexao dbt:** Padrao top N usado nos modelos gold (ex: gold_kpi_produtos_top_receita)

O que voce aprende:
- ORDER BY ASC e DESC
- LIMIT para top N
- Combinar ORDER BY + LIMIT para rankings

---

### Exemplo 03 - WHERE
**Arquivo:** `exemplo-03-where.sql`
**Conceito:** Filtros com operadores =, >, <, IN, BETWEEN, AND/OR
**Pergunta de negocio:** Como filtrar vendas por canal, preco e validacoes?
**Conexao dbt:** Filtros de validacao do silver_vendas (quantidade > 0, preco > 0, IS NOT NULL)

O que voce aprende:
- Operadores de comparacao (=, >, <, >=, <=)
- IN para listas de valores
- BETWEEN para faixas
- AND/OR para combinar condicoes
- Validacao de dados (encontrar registros invalidos)

---

### Exemplo 04 - Campos Calculados
**Arquivo:** `exemplo-04-campos-calculados.sql`
**Conceito:** Criar colunas derivadas com aritmetica e funcoes de data
**Pergunta de negocio:** Qual a receita de cada venda? Em que dia da semana vendemos mais?
**Conexao dbt:** silver_vendas calcula `receita_total = quantidade * preco_unitario` e extrai ano, mes, dia, dia_semana, hora

O que voce aprende:
- Expressoes aritmeticas (quantidade * preco_unitario)
- EXTRACT(YEAR/MONTH/DAY/DOW/HOUR FROM timestamp)
- TO_CHAR para formatar datas
- DATE() para converter timestamp

---

### Exemplo 05 - Funcoes de Agregacao
**Arquivo:** `exemplo-05-funcoes-agregacao.sql`
**Conceito:** SUM, COUNT, AVG, MIN, MAX, COUNT DISTINCT
**Pergunta de negocio:** Qual a receita total? Quantas vendas? Qual o ticket medio?
**Conexao dbt:** Metricas base de TODOS os KPIs gold (receita_total, total_vendas, ticket_medio, clientes_unicos)

O que voce aprende:
- COUNT(*) vs COUNT(DISTINCT)
- SUM, AVG, MIN, MAX
- Combinar multiplas agregacoes numa query
- Montar um painel de metricas estilo KPI

---

### Exemplo 06 - GROUP BY
**Arquivo:** `exemplo-06-group-by.sql`
**Conceito:** Agrupar resultados por dimensao
**Pergunta de negocio:** Qual a receita por canal de venda? E por mes?
**Conexao dbt:** gold_kpi_receita_por_canal agrupa receita por canal_venda

O que voce aprende:
- GROUP BY para agrupar
- Combinar GROUP BY com funcoes de agregacao
- Agrupar por dimensoes temporais (ano, mes)
- Regra: toda coluna no SELECT deve estar no GROUP BY ou ser agregacao

---

### Exemplo 07 - JOIN
**Arquivo:** `exemplo-07-join.sql`
**Conceito:** INNER JOIN para combinar tabelas
**Pergunta de negocio:** Quais produtos foram vendidos? Para quais clientes?
**Conexao dbt:** silver_vendas_enriquecidas faz JOIN vendas + produtos + clientes

O que voce aprende:
- INNER JOIN entre duas tabelas
- Aliases de tabela (v, p, c)
- Triple JOIN (vendas + produtos + clientes)
- Essa e a base do modelo mais importante do dbt

---

### Exemplo 08 - JOIN + GROUP BY
**Arquivo:** `exemplo-08-join-group-by.sql`
**Conceito:** Combinar tabelas E agrupar para analises dimensionais
**Pergunta de negocio:** Qual a receita por categoria? E por marca? E por estado?
**Conexao dbt:** gold_kpi_receita_por_categoria e gold_kpi_receita_por_marca

O que voce aprende:
- JOIN + GROUP BY juntos
- Metricas por categoria, marca, estado
- Analise cruzada (categoria x canal)
- Metricas completas: receita, quantidade, total_vendas, ticket_medio

---

### Exemplo 09 - CASE WHEN
**Arquivo:** `exemplo-09-case-when.sql`
**Conceito:** Classificacoes e categorizacoes condicionais
**Pergunta de negocio:** Como classificar produtos por faixa de preco?
**Conexao dbt:** silver_produtos classifica faixa_preco (PREMIUM/MEDIO/BASICO)

O que voce aprende:
- Sintaxe CASE WHEN / THEN / ELSE / END
- Classificar produtos por faixa de preco (mesma logica do dbt)
- Classificar vendas por tamanho
- Criar flags de validacao (TRUE/FALSE)

---

### Exemplo 10 - Window Functions
**Arquivo:** `exemplo-10-window-functions.sql`
**Conceito:** ROW_NUMBER(), SUM() OVER() para rankings e percentuais
**Pergunta de negocio:** Qual o ranking dos produtos por receita? Qual % de cada canal?
**Conexao dbt:** gold_kpi_produtos_top_receita (ROW_NUMBER), gold_kpi_receita_por_canal (percentual)

O que voce aprende:
- ROW_NUMBER() OVER (ORDER BY ...) para rankings
- PARTITION BY para rankings por grupo
- SUM() OVER () para calcular percentual do total
- Diferenca entre agregacao normal e window function

---

### Exemplo 11 - CTE (WITH) - Query estilo Gold
**Arquivo:** `exemplo-11-cte-query-gold.sql`
**Conceito:** Common Table Expressions para montar queries complexas em camadas
**Pergunta de negocio:** Como montar um KPI completo do zero?
**Conexao dbt:** Cada modelo dbt e basicamente uma CTE! O dbt organiza queries em camadas (bronze → silver → gold)

O que voce aprende:
- Sintaxe WITH ... AS (query)
- Multiplas CTEs encadeadas
- Simular a arquitetura medalha (silver CTE → gold CTE → query final)
- Combinar tudo: JOIN, GROUP BY, CASE WHEN, Window Functions
- Essa e a ponte direta para entender como o dbt funciona

---

## Resumo dos Conceitos

| Exemplo | Conceito | Conexao dbt |
|---------|----------|-------------|
| 01 | SELECT basico | bronze (views raw) |
| 02 | ORDER BY + LIMIT | top N dos gold KPIs |
| 03 | WHERE | filtros de validacao do silver |
| 04 | Campos calculados | silver_vendas (receita_total, datas) |
| 05 | Funcoes de agregacao | metricas base dos gold KPIs |
| 06 | GROUP BY | gold_kpi_receita_por_canal |
| 07 | JOIN | silver_vendas_enriquecidas |
| 08 | JOIN + GROUP BY | gold_kpi_receita_por_categoria |
| 09 | CASE WHEN | silver_produtos (faixa_preco) |
| 10 | Window Functions | gold rankings e percentuais |
| 11 | CTE (WITH) | arquitetura medalha completa |

---

## Perguntas de Negocio Respondidas

### Explorar dados
1. Que dados temos disponiveis? *(Exemplo 01)*
2. Quais os produtos mais caros? *(Exemplo 02)*
3. Quais as maiores vendas? *(Exemplo 02)*

### Filtrar e transformar
4. Quais vendas sao do e-commerce? *(Exemplo 03)*
5. Quais produtos custam entre R$ 100 e R$ 500? *(Exemplo 03)*
6. Existem vendas com dados invalidos? *(Exemplo 03)*
7. Qual a receita de cada venda? *(Exemplo 04)*
8. Em que dia da semana vendemos mais? *(Exemplo 04)*

### Metricas e agrupamentos
9. Qual a receita total e ticket medio? *(Exemplo 05)*
10. Quantos clientes unicos compraram? *(Exemplo 05)*
11. Qual a receita por canal de venda? *(Exemplo 06)*
12. Qual a receita por mes? *(Exemplo 06)*

### Analises com JOINs
13. Quais produtos foram vendidos e para quem? *(Exemplo 07)*
14. Qual a receita por categoria? *(Exemplo 08)*
15. Qual a receita por marca? *(Exemplo 08)*
16. Qual a receita por estado? *(Exemplo 08)*

### Classificacoes e rankings
17. Qual a faixa de preco de cada produto? *(Exemplo 09)*
18. Qual o ranking dos produtos por receita? *(Exemplo 10)*
19. Qual o percentual de receita por canal? *(Exemplo 10)*

### Analise completa
20. Como montar um KPI completo estilo dashboard? *(Exemplo 11)*

---

## Checklist de Aprendizado

Apos completar os 11 exemplos, voce deve ser capaz de:

- [ ] Selecionar e explorar dados (SELECT, LIMIT)
- [ ] Ordenar resultados (ORDER BY)
- [ ] Filtrar registros (WHERE, IN, BETWEEN, AND/OR)
- [ ] Criar campos calculados (aritmetica, EXTRACT, TO_CHAR)
- [ ] Calcular agregacoes (COUNT, SUM, AVG, MIN, MAX)
- [ ] Agrupar dados (GROUP BY)
- [ ] Combinar tabelas (INNER JOIN, triple join)
- [ ] Fazer analises dimensionais (JOIN + GROUP BY)
- [ ] Criar classificacoes (CASE WHEN)
- [ ] Usar window functions (ROW_NUMBER, SUM OVER)
- [ ] Organizar queries com CTEs (WITH)
- [ ] Entender a conexao SQL → dbt (bronze, silver, gold)

---

## Dicas

- **Execute em ordem:** Cada exemplo usa conceitos dos anteriores
- **Leia os comentarios:** Cada query tem `-- Conceito:`, `-- Pergunta de negocio:` e `-- Conexao com dbt:`
- **Modifique:** Tente adaptar as queries para responder outras perguntas
- **Valide:** Sempre verifique se os resultados fazem sentido
- **Pense no dbt:** Quando chegar na aula 03, voce vai reconhecer tudo

---

## Proximos Passos

Depois de dominar os 11 exemplos:

1. Pratique criando suas proprias queries
2. Combine conceitos de diferentes exemplos
3. Avance para a **Aula 02: Python & Ingestao de Dados**
4. Na **Aula 03: dbt**, voce vai reencontrar todos esses conceitos organizados em modelos

**Total: 11 exemplos progressivos, 20 perguntas de negocio, tudo conectado com dbt!**
