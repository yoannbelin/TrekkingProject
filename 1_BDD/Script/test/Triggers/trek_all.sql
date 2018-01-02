DELIMITER |
CREATE PROCEDURE trek_all (IN p_id_user INT, IN p_label VARCHAR(50), IN p_length FLOAT)
BEGIN
INSERT INTO trek
(label, length)
VALUES
(p_label, p_length);
INSERT INTO user_do_trek
(id_user, id_trek)
VALUES
(p_id_user, (SELECT max(trek.id_trek) FROM trek));
END |
DELIMITER ;
