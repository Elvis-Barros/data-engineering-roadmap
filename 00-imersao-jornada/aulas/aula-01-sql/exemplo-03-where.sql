-- ============================================
-- EXEMPLO 03: WHERE - Filtrando registros
-- ============================================
-- Conceito: WHERE com operadores =, >, <, IN, BETWEEN, AND/OR
-- Pergunta de negócio: Como filtrar vendas por canal, preço e validações?
-- Conexão com dbt: Filtros de validação do silver_vendas (quantidade > 0, preco > 0)
--                  e filtro de NULL (WHERE id_cliente IS NOT NULL)

-- ============================================
-- 1. Vendas do canal e-commerce
-- ============================================

SELECT
    id_venda,
    data_venda,
    canal_venda,
    quantidade,
    preco_unitario
FROM vendas
WHERE canal_venda = 'ecommerce'
LIMIT 20;


-- ============================================
-- 2. Vendas da loja física
-- ============================================

SELECT
    id_venda,
    data_venda,
    canal_venda,
    quantidade,
    preco_unitario
FROM vendas
WHERE canal_venda = 'loja_fisica'
LIMIT 20;


-- ============================================
-- 3. Produtos com preço acima de R$ 500
-- ============================================

SELECT
    nome_produto,
    categoria,
    marca,
    preco_atual
FROM produtos
WHERE preco_atual > 500
ORDER BY preco_atual DESC;


-- ============================================
-- 4. Produtos na faixa de R$ 100 a R$ 500 (BETWEEN)
-- ============================================

SELECT
    nome_produto,
    categoria,
    marca,
    preco_atual
FROM produtos
WHERE preco_atual BETWEEN 100 AND 500
ORDER BY preco_atual DESC;


-- ============================================
-- 5. Produtos de categorias específicas (IN)
-- ============================================

SELECT
    nome_produto,
    categoria,
    marca,
    preco_atual
FROM produtos
WHERE categoria IN ('Eletrônicos', 'Tênis')
ORDER BY categoria, preco_atual DESC;


-- ============================================
-- 6. Validação de dados - encontrando problemas
-- ============================================
-- No dbt, silver_vendas filtra: WHERE id_cliente IS NOT NULL AND id_produto IS NOT NULL
-- Aqui verificamos se existem vendas com quantidade ou preço inválido

-- Vendas com quantidade <= 0 (dados inválidos)
SELECT
    id_venda,
    quantidade,
    preco_unitario
FROM vendas
WHERE quantidade <= 0;

-- Vendas com preço unitário <= 0 (dados inválidos)
SELECT
    id_venda,
    quantidade,
    preco_unitario
FROM vendas
WHERE preco_unitario <= 0;


-- ============================================
-- 7. Combinando filtros com AND/OR
-- ============================================
-- Vendas do e-commerce com quantidade > 1 e preço > 100

SELECT
    id_venda,
    canal_venda,
    quantidade,
    preco_unitario
FROM vendas
WHERE canal_venda = 'ecommerce'
  AND quantidade > 1
  AND preco_unitario > 100
ORDER BY preco_unitario DESC
LIMIT 20;
