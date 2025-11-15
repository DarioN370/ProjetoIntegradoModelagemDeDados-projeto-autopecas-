-- -----------------------------------------------------
-- Script de Criação do Banco de Dados - Projeto Autopeças
-- Autor: Dario Miranda Cordeiro Neto - Isabela Périco - Mateus Modena
-- Ferramenta: MySQL Workbench
-- -----------------------------------------------------

-- 1. Criando o banco de dados
-- O "IF NOT EXISTS" é uma segurança para não dar erro caso a database ja exista
CREATE DATABASE IF NOT EXISTS autopeças_db
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_0900_ai_ci; -- garante que acentos e 'ç' funcionem

-- 2. Seleciona o banco para usar
USE autopeças_db;

-- ---------------------------------
-- tab_CLIENTE
-- ---------------------------------
CREATE TABLE CLIENTE (
    id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(150) NOT NULL,  -- NOT NULL = Não pode ficar em branco
    cpf_cliente VARCHAR(11) NOT NULL UNIQUE, -- UNIQUE = Não pode repetir
    endereco VARCHAR(255),
    telefone_cliente VARCHAR(15)
);

-- ---------------------------------
-- tab_FUNCIONARIO
-- ---------------------------------
CREATE TABLE FUNCIONARIO (
    id_Funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(150) NOT NULL,
    cpf_funcionario VARCHAR(11) NOT NULL UNIQUE,
    cargo VARCHAR(50)
);

-- ---------------------------------
-- tab_FORNECEDOR
-- ---------------------------------
CREATE TABLE FORNECEDOR (
    id_Fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    telefone VARCHAR(15),
    cnpj VARCHAR(14) NOT NULL UNIQUE
);