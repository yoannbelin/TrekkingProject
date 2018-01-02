/*
SELECT trek.id_Trek, user.lastName, user.firstName FROM trek
JOIN user_do_trek
ON trek.id_trek = user_do_trek.id_Trek
JOIN user
ON user_do_trek.id_User = user.id_User
ORDER BY trek.id_Trek
*/

/***************** Calcul distance parcourue d'un User *********************//*
SELECT user.id_User, user.lastName, user.firstName, trek.id_Trek, ROUND(SUM(trek.length), 2)
FROM trek
JOIN user_do_trek ON trek.id_Trek = user_do_trek.id_Trek
JOIN USER ON user_do_trek.id_User = user.id_User AND user.id_User = 6 -- /?
GROUP BY user.lastName;
*/

/*********** Recupération des Point_of_Interest d'un User *****************//*
SELECT user.lastname, trek.label, point_of_interest.id_PoI, point_of_interest.label, point_of_interest.id_type
FROM USER
JOIN user_do_trek ON user_do_trek.id_User = user.id_User AND user.id_User = 6 -- /?
JOIN trek ON user_do_trek.id_Trek = trek.id_Trek
JOIN trek_has_gps_point ON trek_has_gps_point.id_trek = trek.id_Trek
JOIN gps_point ON gps_point.id_GPS_point = trek_has_gps_point.id_GPS_point
JOIN point_of_interest ON gps_point.id_GPS_point = point_of_interest.id_GPS_point
*/

/************************* Selection des Trek d'un User ordonné par Date ********//*
SELECT * FROM user
JOIN user_do_trek ON user.id_User = user_do_trek.id_User AND user.id_User = 3 -- /?
JOIN trek ON user_do_trek.id_Trek = trek.id_Trek
ORDER BY user_do_trek.date_Trek
*/

/**************** Calcul le nombre de Trek d'un User *************************//*
/*SELECT user.lastname, COUNT(*) as nb_Trek FROM user
JOIN user_do_trek ON user.id_User = user_do_trek.id_User AND user.id_User = 6 -- /?
JOIN trek ON user_do_trek.id_Trek = trek.id_Trek
GROUP BY user.id_User
*/

/************* Recupére les informations d'un Trek et ses GPS_Points = CARTO.jade (reultat requéte) **************************//*
SELECT * FROM gps_point
JOIN trek_has_gps_point ON gps_point.id_GPS_point = trek_has_gps_point.id_GPS_point
JOIN trek ON trek_has_gps_point.id_Trek = trek.id_Trek AND trek.id_Trek = 3 -- /?
ORDER BY gps_point.latitude
*/

/************  Récupére les Trek d'un User et les Trek généraux = CARTO.jade (liste déroulante) **********************//*
SELECT trek.id_Trek, trek.label FROM trek
JOIN user_do_trek ON trek.id_Trek = user_do_trek.id_Trek
JOIN user ON user_do_trek.id_User = user.id_User
WHERE user.id_User = 1 
UNION 
SELECT trek.id_Trek, trek.label FROM trek
WHERE trek.id_Trek_1 is null
*/

/**************** recupere les Point_of_Interest d'un Trek ****************//*
SELECT * FROM point_of_interest
JOIN gps_point ON point_of_interest.id_GPS_point = gps_point.id_GPS_point
JOIN trek_has_gps_point ON gps_point.id_GPS_point = trek_has_gps_point.id_GPS_point
JOIN trek ON trek_has_gps_point.id_Trek = trek.id_Trek AND trek.id_Trek = 3  -- /?
JOIN type ON type.id_type = point_of_interest.id_type
*/

/***************Recupere les Photos d'un User = page GALERIE_PHOTOS.jade ***************//*
SELECT user.id_user, photos.private, photos.id_photo, photos.url, photos.title, photos.date_photo, photos.id_PoI FROM user
JOIN photos ON user.id_user = photos.id_User
AND user.id_user = 1 -- /?
AND photos.private = 1 -- /?
*/

/***************** Recupere les infos, les Photos (public des User) et les Comments d'un Trek pour l'User et  = page TREK/show.jade ***********//*
SELECT * FROM trek/*
JOIN user_comment_trek ON trek.id_Trek = user_comment_trek.id_Trek
JOIN user ON user_comment_trek.id_User = user.id_User
AND trek.id_Trek  = 1;

SELECT * FROM trek
JOIN trek_has_gps_point ON trek_has_gps_point.id_trek = trek.id_Trek
JOIN gps_point ON gps_point.id_GPS_point = trek_has_gps_point.id_GPS_point
JOIN point_of_interest ON gps_point.id_GPS_point = point_of_interest.id_GPS_point
JOIN photos ON point_of_interest.id_PoI = photos.id_PoI
AND trek.id_Trek = 1;
/* If Trek.id_trek_1 is null récupére les photos de l'User */
/***************** Recupére le profil d'un User et ses Trek = PROFIL.jade ***************************//*
SELECT user.id_user, user.lastname, user.firstname, user.username, user.password, user.mail, user.active, user.created_at, trek.id_Trek, trek.label FROM user 
JOIN user_do_trek ON user.id_user = user_do_trek.id_User
JOIN trek ON user_do_trek.id_Trek = trek.id_Trek
AND user.id_user = 2 -- /?
ORDER BY user_do_trek.date_Trek
*/
 
/***************** Recupére une Photos, ses information et ses Comment = PHOTO/show.jade ***************//*
SELECT photos.private, photos.id_photo, photos.url, photos.title, photos.date_photo, photos.id_PoI, user_comment_photo.date_comment, user_comment_photo.content  FROM photos
JOIN user_comment_photo ON photos.id_photo = user_comment_photo.id_photo
JOIN user ON user_comment_photo.id_User = user.id_user
AND photos.id_photo = 5 -- /?
ORDER BY user_comment_photo.date_comment
*/

/*SELECT * FROM trek
JOIN trek_has_gps_point ON trek_has_gps_point.id_trek = trek.id_Trek
JOIN gps_point ON gps_point.id_GPS_point = trek_has_gps_point.id_GPS_point
JOIN point_of_interest ON gps_point.id_GPS_point = point_of_interest.id_GPS_point
JOIN photos ON point_of_interest.id_PoI = photos.id_PoI
AND trek.id_Trek = 8 
AND photos.private = 0
;
SELECT * FROM trek
JOIN trek_has_gps_point ON trek_has_gps_point.id_trek = trek.id_Trek
JOIN gps_point ON gps_point.id_GPS_point = trek_has_gps_point.id_GPS_point
JOIN point_of_interest ON gps_point.id_GPS_point = point_of_interest.id_GPS_point
JOIN photos ON point_of_interest.id_PoI = photos.id_PoI
AND trek.id_Trek = 8
AND photos.id_user = 1*/

SELECT * FROM trek
JOIN user_do_trek ON trek.id_trek = user_do_trek.id_trek
JOIN user ON user.id_user = user_do_trek.id_User
JOIN trek_has_gps_point ON trek_has_gps_point.id_trek = trek.id_Trek
JOIN gps_point ON gps_point.id_GPS_point = trek_has_gps_point.id_GPS_point
JOIN point_of_interest ON gps_point.id_GPS_point = point_of_interest.id_GPS_point
JOIN photos ON point_of_interest.id_PoI = photos.id_PoI
AND trek.id_trek_1 = 8;

SELECT * FROM trek
JOIN user_do_trek ON trek.id_trek = user_do_trek.id_trek
JOIN user ON user.id_user = user_do_trek.id_User
AND trek.id_trek_1 = 8