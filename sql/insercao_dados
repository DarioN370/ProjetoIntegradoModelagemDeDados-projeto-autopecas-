-- 1. Seleciona o banco de dados que vamos usar
USE autopeças_db;

-- Inserindo Clientes
-- (O id_Cliente é AUTO_INCREMENT)
INSERT INTO CLIENTE (nome_cliente, cpf_cliente, endereco, telefone_cliente) VALUES 
('Gabriel Toledo', '11122233344', 'Rua da Vitoria, 123, São Paulo', '19999998888'),
('Kaique Cerato', '55566677788', 'Avenida dos Titulos, 456, São Paulo', '19888887777'),
('Danil Golubenko', '99988877766', 'Rua da Praça, 789, Poços de Caldas', '35911112222');

-- Inserindo Funcionários
INSERT INTO FUNCIONARIO (nome_funcionario, cpf_funcionario, cargo) VALUES
('Stephen Curry', '12312312344', 'Vendedor'),
('Max Verstapen', '45645645677', 'Gerente de Estoque'),
('Lando Norris', '78978978900', 'Caixa');

-- Inserindo Fornecedores
INSERT INTO FORNECEDOR (nome, telefone, cnpj) VALUES
('Bosch Peças Automotivas BR', '1140045000', '12345678901234'),
('Magneti Marelli Cofap', '1150006000', '98765432109876'),
('NGK Componentes', '1122223333', '55566677788899');

-- Inserindo Categorias
INSERT INTO CATEGORIA (nome, descricao) VALUES
('Freios', 'Peças para o sistema de frenagem, como pastilhas e discos.'),
('Motor', 'Componentes do motor, ignição e filtros.'),
('Suspensão', 'Amortecedores, molas e componentes da suspensão.'),
('Elétrica', 'Baterias, velas, cabos e lâmpadas.');

-- Inserindo Produtos
INSERT INTO PRODUTO (nome_produto, descricao_produto, preco_unitario, estoque_atual, marca_produto, codigo_universal) VALUES
('Pastilha de Freio Dianteira Gol G5', 'Jogo de pastilhas de cerâmica para VW Gol G5/G6', 145.50, 50, 'Bosch', 'PD-BOSCH-100'),
('Filtro de Óleo Motor 1.0/1.6', 'Filtro de óleo blindado para motores VW/Ford', 45.00, 150, 'Magneti Marelli', 'FO-MAR-201'),
('Amortecedor Dianteiro Uno/Palio', 'Unidade - Amortecedor Turbogás Dianteiro Fiat', 280.00, 30, 'Cofap', 'AM-COF-302'),
('Vela de Ignição Iridium', 'Unidade - Vela de ignição Iridium Laser', 85.00, 80, 'NGK', 'VK-NGK-403');

-- -----------------------------------------------------
-- PASSO 2: Inserir dados nas tabelas de Cardinalidade N:N
-- (Aqui usamos os IDs das tabelas que criamos em cima)
-- -----------------------------------------------------

-- Ligando Produtos às Categorias
-- (Assumindo que os produtos acima são IDs 1, 2, 3, 4 e as categorias são 1, 2, 3, 4)
INSERT INTO PRODUTO_CATEGORIA (id_produto, id_Categoria) VALUES
(1, 1), -- Pastilha de Freio (ID 1) -> Categoria Freios (ID 1)
(2, 2), -- Filtro de Óleo (ID 2) -> Categoria Motor (ID 2)
(3, 3), -- Amortecedor (ID 3) -> Categoria Suspensão (ID 3)
(4, 2), -- Vela de Ignição (ID 4) -> Categoria Motor (ID 2)
(4, 4); -- Vela de Ignição (ID 4) -> Categoria Elétrica (ID 4)

-- Ligando Produtos aos Fornecedores
INSERT INTO PRODUTO_FORNECEDOR (id_produto, id_Fornecedor, custo_compra) VALUES
(1, 1, 90.00),  -- Pastilha (ID 1) -> Fornecedor Bosch (ID 1)
(2, 2, 28.00),  -- Filtro (ID 2) -> Fornecedor M. Marelli (ID 2)
(3, 2, 190.50), -- Amortecedor (ID 3) -> Fornecedor M. Marelli (ID 2)
(4, 3, 55.00);  -- Vela (ID 4) -> Fornecedor NGK (ID 3)

-- -----------------------------------------------------
-- PASSO 3: Inserir a VENDA (que depende de Cliente e Funcionario)
-- -----------------------------------------------------
-- Criei duas vendas de exemplo
INSERT INTO VENDA (data_venda, valor_total, forma_pagamento, id_Cliente, id_Funcionario) VALUES
-- Venda 1: Gabriel Toledo (ID 1) foi atendido por Stephen Curry (ID 1)
('2025-11-14 10:30:00', 190.50, 'Pix', 1, 1), 
-- Venda 2: Kaique Cerato (ID 2) foi atendido por Lando Norris (ID 3)
('2025-11-15 11:15:00', 645.00, 'Crédito', 2, 3);

-- -----------------------------------------------------
-- PASSO 4: Inserir os ITENS DA VENDA (que depende de Venda e Produto)
-- -----------------------------------------------------

-- Itens da Venda 1 (ID da Venda = 1)
INSERT INTO ITEM_VENDA (id_Venda, id_produto, quantidade, preco_unitario_na_venda) VALUES
(1, 1, 1, 145.50), -- 1x Pastilha de Freio (ID 1) na Venda 1
(1, 2, 1, 45.00);  -- 1x Filtro de Óleo (ID 2) na Venda 1
-- (Total da Venda 1 = 145.50 + 45.00 = 190.50. Bateu!)

-- Itens da Venda 2 (ID da Venda = 2)
INSERT INTO ITEM_VENDA (id_Venda, id_produto, quantidade, preco_unitario_na_venda) VALUES
(2, 3, 2, 280.00), -- 2x Amortecedor (ID 3) na Venda 2 (Total 560.00)
(2, 4, 1, 85.00);  -- 1x Vela (ID 4) na Venda 2 (Total 85.00)
-- (Total da Venda 2 = 560.00 + 85.00 = 645.00. Bateu!)