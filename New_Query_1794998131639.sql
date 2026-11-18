CREATE TABLE CLIENTE (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(120) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE
);

CREATE TABLE ENDERECO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    rua VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    bairro VARCHAR(80) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    complemento VARCHAR(120),

    CONSTRAINT fk_endereco_cliente
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id)
);

CREATE TABLE PEDIDO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_endereco INT NOT NULL,
    data_pedido DATETIME NOT NULL,
    pagamento VARCHAR(40) NOT NULL,

    CONSTRAINT fk_pedido_cliente
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id),

    CONSTRAINT fk_pedido_endereco
    FOREIGN KEY (id_endereco) REFERENCES ENDERECO(id)
);

CREATE TABLE PRODUTO (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    descricao TEXT,
    categoria VARCHAR(80) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL
);

CREATE TABLE ITEM_PEDIDO (
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    desconto DECIMAL(5,2) DEFAULT 0.00,

    PRIMARY KEY (pedido_id, produto_id),

    CONSTRAINT fk_item_pedido
    FOREIGN KEY (pedido_id) REFERENCES PEDIDO(id),

    CONSTRAINT fk_item_produto
    FOREIGN KEY (produto_id) REFERENCES PRODUTO(id)
);

SHOW TABLES;