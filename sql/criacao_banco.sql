-------------------------------------------------------
-- Script de Criação do Banco de Dados - Projeto Autopeças
-- Autor: Dario Miranda Cordeiro Neto - Isabela Périco - Mateus Modena
-- Ferramenta: MySQL Workbench
-------------------------------------------------------

-- 1. Criando o banco de dados
-- O "IF NOT EXISTS" é uma segurança para não dar erro caso a database ja exista
CREATE DATABASE IF NOT EXISTS autopecas_db
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_0900_ai_ci; -- garante que acentos e 'ç' funcionem

-- 2. Seleciona o banco para usar
USE autopecas_db;

-----------------------------------
-- tab_CLIENTE
-----------------------------------
CREATE TABLE CLIENTE (
    id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(150) NOT NULL,  -- NOT NULL = Não pode ficar em branco
    cpf_cliente VARCHAR(11) NOT NULL UNIQUE, -- UNIQUE = Não pode repetir
    endereco VARCHAR(255),
    telefone_cliente VARCHAR(15)
);

-----------------------------------
-- tab_FUNCIONARIO
-----------------------------------
CREATE TABLE FUNCIONARIO (
    id_Funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(150) NOT NULL,
    cpf_funcionario VARCHAR(11) NOT NULL UNIQUE,
    cargo VARCHAR(50)
);

-----------------------------------
-- tab_FORNECEDOR
-----------------------------------
CREATE TABLE FORNECEDOR (
    id_Fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    telefone VARCHAR(15),
    cnpj VARCHAR(14) NOT NULL UNIQUE
);

-----------------------------------
-- tab_CATEGORIA
-----------------------------------
CREATE TABLE CATEGORIA (
    id_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

-----------------------------------
-- tab_PRODUTO
-----------------------------------
CREATE TABLE PRODUTO (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(200) NOT NULL,
    descricao_produto TEXT,
    preco_unitario DECIMAL(10, 2) NOT NULL DEFAULT 0.00, -- 10 dígitos, 2 decimais. DEFAULT 0.00 para não ficar nulo, sempre tera um valor
    estoque_atual INT NOT NULL DEFAULT 0,
    marca_produto VARCHAR(100),
    codigo_universal VARCHAR(50) UNIQUE -- Part number é bom ser único
);


-----------------------------------
-- tab_VENDA - Tabela de evento, armazena o evento da venda realizada
-----------------------------------
CREATE TABLE VENDA (
    id_Venda INT AUTO_INCREMENT PRIMARY KEY,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP, -- data e hora atuais
    valor_total DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    forma_pagamento VARCHAR(50),
    
    -- 1. Colunas que vão receber as Chaves Estrangeiras (FKs)
    id_Cliente INT,
    id_Funcionario INT,
    
    -- 2. Agora, declarando as restrições (constraints), Isso serve para amarrar o id_Cliente da VENDA ao id_Cliente da tabela CLIENTE
    CONSTRAINT fk_venda_cliente FOREIGN KEY (id_Cliente) REFERENCES CLIENTE(id_Cliente),
    CONSTRAINT fk_venda_funcionario FOREIGN KEY (id_Funcionario) REFERENCES FUNCIONARIO(id_Funcionario)
);

-- ---------------------------------
-- Tabela ITEM_VENDA (Cardinalidade N:N)
-- ---------------------------------
CREATE TABLE ITEM_VENDA (
    -- Chaves Estrangeiras que também são Chaves Primárias
    id_Venda INT,
    id_produto INT,
    
    -- Atributos do relacionamento
    quantidade INT NOT NULL DEFAULT 1,
    preco_unitario_na_venda DECIMAL(10, 2) NOT NULL,
    
    -- Definindo a Chave Primária Composta (duas chaves juntas)
    PRIMARY KEY (id_Venda, id_produto),
    
    -- Definindo as Chaves Estrangeiras
    CONSTRAINT fk_item_venda FOREIGN KEY (id_Venda) REFERENCES VENDA(id_Venda),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto)
);

-- ---------------------------------
-- Tabela PRODUTO_CATEGORIA (CArdinalidade N:N)
-- ---------------------------------
CREATE TABLE PRODUTO_CATEGORIA (
    id_produto INT,
    id_Categoria INT,
    
    -- Chave Primária Composta
    PRIMARY KEY (id_produto, id_Categoria),
    
    -- Chaves Estrangeiras
    CONSTRAINT fk_prodcat_produto FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto),
    CONSTRAINT fk_prodcat_categoria FOREIGN KEY (id_Categoria) REFERENCES CATEGORIA(id_Categoria)
);

-- ---------------------------------
-- Tabela PRODUTO_FORNECEDOR (Cardinalidade N:N)
-- ---------------------------------
CREATE TABLE PRODUTO_FORNECEDOR (
    id_produto INT,
    id_Fornecedor INT,
    custo_compra DECIMAL(10, 2), -- Quanto pago p/ peça
    
    -- Chave Primária Composta
    PRIMARY KEY (id_produto, id_Fornecedor),
    
    -- Chaves Estrangeiras
    CONSTRAINT fk_prodfor_produto FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto),
    CONSTRAINT fk_prodfor_fornecedor FOREIGN KEY (id_Fornecedor) REFERENCES FORNECEDOR(id_Fornecedor)
);