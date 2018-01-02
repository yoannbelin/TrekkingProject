/*TRIGGER APRES INSERTION D UN TREK - A COMBINER A LA PS 'update_user_do_trek' */
DELIMITER |
CREATE TRIGGER after_insert_trek AFTER INSERT
ON trek FOR EACH ROW
BEGIN
INSERT INTO user_do_trek (id_user, id_trek)
VALUES (1, (SELECT id_trek FROM trek WHERE id_trek = NEW.id_trek));
END |
BEGIN
DELIMITER ;

DELIMITER |
CREATE PROCEDURE update_user_do_trek (IN p_id_user INT)
BEGIN
UPDATE user_do_trek
SET id_user = p_id_user
WHERE user_do_trek.id_trek = (SELECT max(trek.id_trek) FROM trek);
END |
DELIMITER ;


DELIMITER |
CREATE TRIGGER after_insert_gps_point AFTER INSERT
ON gps_point FOR EACH ROW
BEGIN
INSERT INTO trek_has_gps_point (id_trek, id_gps_point)
VALUES ((SELECT max(trek.id_trek) FROM trek), (SELECT id_gps_point FROM gps_point WHERE id_gps_point = NEW.id_gps_point));
END |
BEGIN
DELIMITER ;
--
