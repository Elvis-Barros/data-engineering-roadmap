-- ============================================
-- EXEMPLO 06: GROUP BY - Agrupando resultados
-- ============================================
-- Conceito: GROUP BY para agrupar e agregar por dimensão
-- Pergunta de negócio: Qual a receita por canal de venda? E por mês?
-- Conexão com dbt: gold_kpi_receita_por_canal agrupa receita por canal_venda
--                  gold_kpi_vendas_temporais agrupa por data

-- ============================================
-- 1. Receita por canal de venda
-- ============================================
-- Esse é EXATAMENTE o gold_kpi_receita_por_canal (sem window function ainda)

SELECT
    canal_venda,
    SUM(quantidade * preco_unitario) AS receita_total,
    COUNT(*) AS total_vendas
FROM vendas
GROUP BY canal_venda
ORDER BY receita_total DESC;


-- ============================================
-- 2. Contagem de vendas por canal
-- ============================================

SELECT
    canal_venda,
    COUNT(*) AS total_vendas,
    COUNT(DISTINCT id_cliente) AS clientes_unicos,
    SUM(quantidade) AS quantidade_total
FROM vendas
GROUP BY canal_venda
ORDER BY total_vendas DESC;


-- ============================================
-- 3. Ticket médio por canal
-- ============================================

SELECT
    canal_venda,
    SUM(quantidade * preco_unitario) AS receita_total,
    COUNT(*) AS total_vendas,
    AVG(quantidade * preco_unitario) AS ticket_medio
FROM vendas
GROUP BY canal_venda
ORDER BY ticket_medio DESC;


-- ============================================
-- 4. Produtos por categoria (contagem)
-- ============================================

SELECT
    categoria,
    COUNT(*) AS total_produtos,
    AVG(preco_atual) AS preco_medio,
    MIN(preco_atual) AS preco_minimo,
    MAX(preco_atual) AS preco_maximo
FROM produtos
GROUP BY categoria
ORDER BY total_produtos DESC;
