CREATE TABLE clientes (
id SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
correo VARCHAR(120) UNIQUE,
telefono VARCHAR(15),
provincia VARCHAR(50)
);

CREATE TABLE productos (
id SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio INTEGER NOT NULL CHECK (precio > 0),
activo BOOLEAN DEFAULT true
);

CREATE TABLE pedidos (
id SERIAL PRIMARY KEY,
cliente_id INTEGER NOT NULL REFERENCES clientes(id),
fecha TIMESTAMP NOT NULL DEFAULT now(),
total INTEGER NOT NULL DEFAULT 0
);

--
INSERT INTO clientes (nombre, correo, telefono, provincia) VALUES
('German Fernández', 'g.fernandez@email.com', '88451236', 'San José'),
('Carlos Mendez', 'carlos.mdz@email.com', '87652341', 'Alajuela'),
('Glory Pizarro', 'g.pizarro@email.com', '89234567', 'Heredia');

SELECT * FROM clientes


INSERT INTO pedidos (cliente_id, total) 
VALUES
(1, 15000),
(2, 8500),
(3, 22300);

--
INSERT INTO productos (nombre, precio) VALUES
('Café chorreado', 1200), ('Americano', 1200), ('Capuchino', 1900),
('Latte', 2100), ('Mocha', 2400), ('Cajeta de café', 2750),
('Pan de banano', 1500), ('Empanada de queso', 1300);


INSERT INTO clientes (nombre, correo, telefono, provincia) VALUES
('Kimberly Vargas','kimberly.vargas@correo.cr','8712-4405','San José'),
('Josué Solano','josue.solano@correo.cr','8830-1192','Heredia'),
('Marianela Quirós','mari.quiros@correo.cr','7011-5583','Cartago'),
('Randall Jiménez','randall.jimenez@correo.cr','8945-2260','San José'),
('Adriana Mora','adriana.mora@correo.cr','6122-8874','Alajuela');

SELECT * FROM clientes;

INSERT INTO pedidos (cliente_id, fecha, total)
VALUES
(1, '2026-08-14 09:15', 3800),
(4, '2026-08-15 11:30', 5200),
(6, '2026-08-16 14:45', 2100),
(2, '2026-08-17 10:00', 7600),
(8, '2026-08-18 16:20', 4300),
(5, '2026-08-19 12:05', 3150);

SELECT count(*) FROM clientes;
SELECT count(*) FROM productos;
SELECT count(*) FROM pedidos;

SELECT p.id, c.nombre, p.fecha, p.total
FROM pedidos p JOIN clientes c ON p.cliente_id = c.id
ORDER BY p.fecha;

UPDATE pedidos SET fecha = '2026-08-13 08:30' WHERE id = 1;
UPDATE pedidos SET fecha = '2026-08-13 15:50' WHERE id = 2;
UPDATE pedidos SET fecha = '2026-08-14 17:10' WHERE id = 3;

SELECT * FROM pedidos WHERE id = 4;
SELECT * FROM pedidos ORDER BY id;
SELECT * FROM clientes WHERE id = 5;

--
