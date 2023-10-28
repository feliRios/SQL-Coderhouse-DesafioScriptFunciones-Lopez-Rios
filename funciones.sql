USE success_mindset;

-- Funcion STOCK_GENERO (permite calcular la cantidad total de libros en stock de un determinado genero)
DELIMITER $$
CREATE FUNCTION stock_genero(id_genero INT)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE stock_total INT;
    SELECT SUM(stock) INTO stock_total
    FROM publicacion p
    JOIN ficha_libro f ON p.book = f.id_book
    WHERE f.genre = id_genero;
    RETURN stock_total;
END $$
DELIMITER ;

-- Funcion PRECIO_PROMEDIO (permite calcular el promedio de precio de un libro en especifico)
DELIMITER $$
CREATE FUNCTION precio_promedio(libro_id INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE prom FLOAT;
    SELECT AVG(p.price) INTO prom
    FROM publicacion p
    WHERE p.book = libro_id;
    RETURN prom;
END $$
DELIMITER ;