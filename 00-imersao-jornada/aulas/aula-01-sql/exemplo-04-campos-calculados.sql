-- ============================================
-- EXEMPLO 04: Campos Calculados - Criando novas colunas
-- ============================================
-- Conceito: Expressões aritméticas e funções de data para criar colunas derivadas
-- Pergunta de negócio: Qual a receita de cada venda? Em que dia da semana vendemos mais?
-- Conexão com dbt: silver_vendas calcula receita_total = quantidade * preco_unitario
--                  e extrai ano_venda, mes_venda, dia_venda, dia_semana, hora_venda

-- ============================================
-- 1. Receita total de cada venda (quantidade × preço)
-- ============================================
-- Esse cálculo é EXATAMENTE o que o silver_vendas faz no dbt

SELECT
    id_venda,
    quantidade,
    preco_unitario,
    quantidade * preco_unitario AS receita_total
FROM vendas
ORDER BY receita_total DESC
LIMIT 20;


-- ============================================
-- 2. Extraindo dimensões temporais com EXTRACT
-- ============================================
-- No dbt, silver_vendas extrai: ano, mês, dia, dia da semana, hora
-- Isso permite análises temporais nos modelos gold

SELECT
    id_venda,
    data_venda,
    EXTRACT(YEAR FROM data_venda::timestamp) AS ano_venda,
    EXTRACT(MONTH FROM data_venda::timestamp) AS mes_venda,
    EXTRACT(DAY FROM data_venda::timestamp) AS dia_venda,
    EXTRACT(DOW FROM data_venda::timestamp) AS dia_semana,  -- 0 = Domingo, 6 = Sábado
    EXTRACT(HOUR FROM data_venda::timestamp) AS hora_venda
FROM vendas
ORDER BY data_venda DESC
LIMIT 20;


-- ============================================
-- 3. Dia da semana legível com TO_CHAR
-- ============================================

SELECT
    id_venda,
    data_venda,
    TO_CHAR(data_venda::timestamp, 'Day') AS dia_semana_nome,
    EXTRACT(DOW FROM data_venda::timestamp) AS dia_semana_numero
FROM vendas
ORDER BY data_venda DESC
LIMIT 20;


-- ============================================
-- 4. Combinando: receita + dimensões temporais
-- ============================================
-- Visão completa que prepara os dados para análise - espelho do silver_vendas

SELECT
    id_venda,
    id_cliente,
    id_produto,
    canal_venda,
    quantidade,
    preco_unitario,
    quantidade * preco_unitario AS receita_total,
    DATE(data_venda::timestamp) AS data_venda_date,
    EXTRACT(YEAR FROM data_venda::timestamp) AS ano_venda,
    EXTRACT(MONTH FROM data_venda::timestamp) AS mes_venda,
    EXTRACT(DAY FROM data_venda::timestamp) AS dia_venda,
    EXTRACT(DOW FROM data_venda::timestamp) AS dia_semana,
    EXTRACT(HOUR FROM data_venda::timestamp) AS hora_venda
FROM vendas
ORDER BY data_venda DESC
LIMIT 20;
