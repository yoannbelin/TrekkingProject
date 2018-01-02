/************  Récupére les Trek d'un User et les Trek généraux = CARTO.jade (liste déroulante) **********************/

SELECT Trek.id_trek, Trek.label FROM Trek
JOIN User_do_Trek ON Trek.id_trek = User_do_Trek.id_trek
JOIN User ON User_do_Trek.id_user = User.id_user
WHERE User.id_user = 1
UNION
SELECT Trek.id_trek, Trek.label FROM Trek
WHERE Trek.id_trek_1 is null;


/************* Recupére les informations d'un Trek et ses GPS_Points = CARTO.jade (reultat requéte) **************************/

SELECT * FROM GPS_point
JOIN Trek_has_GPS_point ON GPS_point.id_GPS_point = Trek_has_GPS_point.id_GPS_point
JOIN Trek ON Trek_has_GPS_point.id_Trek = Trek.id_trek AND Trek.id_trek = 3 -- /?
ORDER BY GPS_point.latitude;




/************* Recupére les informations d'un Trek et ses GPS_Points = CARTO.jade (reultat requéte) **************************/

SELECT * FROM Trek
JOIN Trek_has_PoI ON Trek.id_trek = Trek_has_PoI.id_trek
JOIN Point_of_Interest ON Trek_has_PoI.id_PoI = Point_of_Interest.id_PoI
JOIN Type ON Point_of_Interest.id_type = Type.id_type
AND Trek.id_trek = 9;-- /?

SELECT * FROM Trek
JOIN Photo ON Trek.id_trek = Photo.id_trek
AND Trek.id_trek = 9;-- /?

SELECT * FROM Trek
JOIN User_comment_Trek ON Trek.id_trek = User_comment_Trek.id_trek
JOIN User ON User_comment_Trek.id_user = User.id_user
AND Trek.id_trek = 3;-- /?
