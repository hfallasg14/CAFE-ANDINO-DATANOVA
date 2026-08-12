CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100)
	);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);	

INSERT INTO clientes (id_cliente, nombre) VALUES
(1, 'Felipe Rodríguez'),
(2, 'Carlos Méndez'),
(3, 'Gloriana Jiménez');

INSERT INTO pedidos (id_pedido, id_cliente) VALUES
(50, 1),
(100, 1),
(60, 2),
(55, 3),
(120, 2);

