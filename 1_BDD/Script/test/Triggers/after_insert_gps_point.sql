# PROCEDURE STOCKEE & TRIGGER



DELIMITER |
#TRIGGER FOR NEW GPS POINT

CREATE TRIGGER after_insert_gps_point AFTER INSERT
ON gps_point FOR EACH ROW
BEGIN
	INSERT INTO trek_has_gps_point ( id_trek, id_gps_point)
    VALUES ( (SELECT max(id_trek) FROM trek), (select id_gps_point from gps_point where id_gps_point = new.id_gps_point) );
END |

DELIMITER ;
