
DELIMITER //

CREATE TRIGGER UPDATE_Data_Final
AFTER UPDATE
ON t8_aux_deslocamento
FOR EACH ROW
BEGIN
    DECLARE id_existente INT;

    SELECT id INTO id_existente
    FROM t8_deslocamento
    WHERE id = NEW.id
    LIMIT 1;

    IF id_existente IS NOT NULL THEN
        UPDATE t8_deslocamento
        SET Data_Final = NEW.Data_Final
        WHERE id = NEW.id AND (Data_Final<>NEW.Data_Final OR NEW.Data_Final IS NOT NULL);

    END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER UPDATE_Data_A
AFTER UPDATE
ON t8_aux_deslocamento
FOR EACH ROW
BEGIN
    DECLARE id_existente INT;

    SELECT id INTO id_existente
    FROM t8_deslocamento
    WHERE id = NEW.id
    LIMIT 1;

    IF id_existente IS NOT NULL THEN
        UPDATE t8_deslocamento
        SET Data_A = NEW.Data_A
        WHERE id = NEW.id AND (Data_A<>NEW.Data_A OR NEW.Data_A IS NOT NULL);
        
 
    END IF;
END //

DELIMITER ;




DELIMITER //

CREATE TRIGGER UPDATE_Data_B
AFTER UPDATE
ON t8_aux_deslocamento
FOR EACH ROW
BEGIN
    DECLARE id_existente INT;

    SELECT id INTO id_existente
    FROM t8_deslocamento
    WHERE id = NEW.id
    LIMIT 1;

    IF id_existente IS NOT NULL THEN
        UPDATE t8_deslocamento
        SET Data_B = NEW.Data_B
        WHERE id = NEW.id AND (Data_B<>NEW.Data_B OR NEW.Data_B IS NOT NULL);
        

    END IF;
END //

DELIMITER ;




DELIMITER //

CREATE TRIGGER UPDATE_Data_C
AFTER UPDATE
ON t8_aux_deslocamento
FOR EACH ROW
BEGIN
    DECLARE id_existente INT;

    SELECT id INTO id_existente
    FROM t8_deslocamento
    WHERE id = NEW.id
    LIMIT 1;

    IF id_existente IS NOT NULL THEN
        UPDATE t8_deslocamento
        SET Data_C = NEW.Data_C
        WHERE id = NEW.id AND (Data_C<>NEW.Data_C OR NEW.Data_C IS NOT NULL);
        

    END IF;
END //

DELIMITER ;





DELIMITER //

CREATE TRIGGER UPDATE_Data_D
AFTER UPDATE
ON t8_aux_deslocamento
FOR EACH ROW
BEGIN
    DECLARE id_existente INT;

    SELECT id INTO id_existente
    FROM t8_deslocamento
    WHERE id = NEW.id
    LIMIT 1;

    IF id_existente IS NOT NULL THEN
        UPDATE t8_deslocamento
        SET Data_D = NEW.Data_D
        WHERE id = NEW.id AND (Data_D<>NEW.Data_D AND NEW.Data_D IS NOT NULL);
        
        -- Evita a inserção da nova linha
    END IF;
END //

DELIMITER ;

-- ---------------------------------------------


DELIMITER //

CREATE TRIGGER Update_Ponto_C
AFTER UPDATE ON t8_aux_deslocamento
FOR EACH ROW
BEGIN
    IF TRIM(NEW.id_original) = TRIM(OLD.id_original) THEN
        UPDATE t8_deslocamento D
        JOIN t3_transittime J ON TRIM(D.cliente_cidade) = TRIM(J.Cidade)
        SET D.Ponto_C = J.Ponto_C
        WHERE TRIM(D.id_original) = TRIM(NEW.id_original) AND TRIM(NEW.Ponto_C) = TRIM(J.Ponto_C);
    END IF;
END//

DELIMITER ;


DELIMITER //

CREATE TRIGGER Update_Ponto_A
AFTER UPDATE ON t8_aux_deslocamento
FOR EACH ROW
BEGIN
    IF TRIM(NEW.id_original) = TRIM(OLD.id_original) THEN
        UPDATE t8_deslocamento D
        JOIN t3_transittime J ON TRIM(D.cliente_cidade) = TRIM(J.Cidade)
        SET D.Ponto_A = J.Ponto_A
        WHERE TRIM(D.id_original) = TRIM(NEW.id_original) AND TRIM(NEW.Ponto_A) = TRIM(J.Ponto_A);
    END IF;
END//

DELIMITER ;

DELIMITER //

CREATE TRIGGER Update_Ponto_B
AFTER UPDATE ON t8_aux_deslocamento
FOR EACH ROW
BEGIN
    IF TRIM(NEW.id_original) = TRIM(OLD.id_original) THEN
        UPDATE t8_deslocamento D
        JOIN t3_transittime J ON TRIM(D.cliente_cidade) = TRIM(J.Cidade)
        SET D.Ponto_B = J.Ponto_B
        WHERE TRIM(D.id_original) = TRIM(NEW.id_original) AND TRIM(NEW.Ponto_B) = TRIM(J.Ponto_B);
    END IF;
END//

DELIMITER ;


DELIMITER //

CREATE TRIGGER Update_Ponto_D
AFTER UPDATE ON t8_aux_deslocamento
FOR EACH ROW
BEGIN
    IF TRIM(NEW.id_original) = TRIM(OLD.id_original) THEN
        UPDATE t8_deslocamento D
        JOIN t3_transittime J ON TRIM(D.cliente_cidade) = TRIM(J.Cidade)
        SET D.Ponto_D = J.Ponto_D
        WHERE TRIM(D.id_original) = TRIM(NEW.id_original) AND TRIM(NEW.Ponto_D) = TRIM(J.Ponto_D);
    END IF;
END//

DELIMITER ;


DELIMITER //

CREATE TRIGGER Update_Ponto_Final
AFTER UPDATE ON t8_aux_deslocamento
FOR EACH ROW
BEGIN
    IF TRIM(NEW.id_original) = TRIM(OLD.id_original) THEN
        UPDATE t8_deslocamento D
        JOIN t3_transittime J ON TRIM(D.cliente_cidade) = TRIM(J.Cidade)
        SET D.Ponto_Chegada = J.Ponto_Chegada
        WHERE TRIM(D.id_original) = TRIM(NEW.id_original) AND TRIM(NEW.Ponto_Chegada) = TRIM(J.Ponto_Chegada);
    END IF;
END//

DELIMITER ;


----------------------------------------------------------------------------

DELIMITER //

CREATE TRIGGER UPDATE_Data_Final
AFTER UPDATE
ON t8_deslocamento
FOR EACH ROW
BEGIN
    DECLARE id_existente INT;

    SELECT id INTO id_existente
    FROM t8_deslocamento
    WHERE id = NEW.id
    LIMIT 1;

    IF id_existente IS NOT NULL THEN
        UPDATE t1_pedidos
        SET Entrega_Realizada = NEW.Data_Final
        WHERE id = NEW.id AND (Entrega_Realizada<>NEW.Data_Final OR NEW.Data_Final IS NOT NULL);
        
    END IF;
END //

DELIMITER ;