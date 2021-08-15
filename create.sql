#### Table name userprofile
CREATE TABLE public.userprofile
(
    user_id character varying(50) COLLATE pg_catalog."default" NOT NULL,
    latitude character varying(20) COLLATE pg_catalog."default",
    longitude character varying(20) COLLATE pg_catalog."default",
    smoker character varying(50) COLLATE pg_catalog."default",
    drinklevel character varying(50) COLLATE pg_catalog."default",
    dress_preference character varying(50) COLLATE pg_catalog."default",
    ambience character varying(50) COLLATE pg_catalog."default",
    transport character varying(50) COLLATE pg_catalog."default",
    marital_status character varying(50) COLLATE pg_catalog."default",
    household character varying(50) COLLATE pg_catalog."default",
    birth_year character varying(50) COLLATE pg_catalog."default",
    interest character varying(50) COLLATE pg_catalog."default",
    personality character varying(50) COLLATE pg_catalog."default",
    religion character varying(50) COLLATE pg_catalog."default",
    activity character varying(50) COLLATE pg_catalog."default",
    color character varying(50) COLLATE pg_catalog."default",
    weight character varying(10) COLLATE pg_catalog."default",
    budget character varying(10) COLLATE pg_catalog."default",
    height character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT userprofile_pkey PRIMARY KEY (user_id)
)

#### Table name Reslocation
CREATE TABLE public.reslocation
(
    place_id character varying(20) COLLATE pg_catalog."default" NOT NULL,
    latitude character varying(20) COLLATE pg_catalog."default",
    longitude character varying(20) COLLATE pg_catalog."default",
    geospatial character varying(100) COLLATE pg_catalog."default",
    name character varying(100) COLLATE pg_catalog."default",
    address character varying(100) COLLATE pg_catalog."default",
    city character varying(50) COLLATE pg_catalog."default",
    state character varying(50) COLLATE pg_catalog."default",
    country character varying(50) COLLATE pg_catalog."default",
    fax character varying(50) COLLATE pg_catalog."default",
    zip character varying(50) COLLATE pg_catalog."default",
    alcohol character varying(50) COLLATE pg_catalog."default",
    smoking_area character varying(50) COLLATE pg_catalog."default",
    dress_code character varying(50) COLLATE pg_catalog."default",
    accessibility character varying(50) COLLATE pg_catalog."default",
    price character varying(50) COLLATE pg_catalog."default",
    url character varying(50) COLLATE pg_catalog."default",
    ambience character varying(50) COLLATE pg_catalog."default",
    franchise character varying(50) COLLATE pg_catalog."default",
    area character varying(50) COLLATE pg_catalog."default",
    other_service character varying(50) COLLATE pg_catalog."default",
	CONSTRAINT reslocation_pkey PRIMARY KEY (place_id)
)

#### Table name respayment
CREATE TABLE public.respayment
(
    place_id character varying(50) COLLATE pg_catalog."default",
    payment character varying(20) COLLATE pg_catalog."default", CONSTRAINT respayment_fk Foreign Key(place_id) References Reslocation(place_id)
)

#######################################################################################################################################

#### Table name recuisines
CREATE TABLE public.rescuisines
(
    place_id character varying(20) COLLATE pg_catalog."default",
    cuisines character varying(20) COLLATE pg_catalog."default", CONSTRAINT recuisines_fk Foreign Key(place_id) References Reslocation(place_id)
)

CREATE TABLE public.temp_Recuisines
(
    Place_id  varchar(50),
    Cuisines varchar(20) 
	 
)
#######################################################################################################################################

#### Table name Reparking
CREATE TABLE public.Reparking
(
    place_id character varying(20) COLLATE pg_catalog."default",
    Parking_lot character varying(20) COLLATE pg_catalog."default", CONSTRAINT reparking_fk Foreign Key(place_id) References Reslocation(place_id)
	
)

CREATE TABLE public.temp_Resparking
(
    place_id varchar(50),
    Parking_lot varchar(20))


###########################################################################################################################################

#### Table name UserRating
CREATE TABLE public.UserRating
(
    user_id character varying(50) COLLATE pg_catalog."default",
	Place_id character varying(50) COLLATE pg_catalog."default",
	Rating character varying(50) COLLATE pg_catalog."default",
	Food_rating character varying(50) COLLATE pg_catalog."default",
    Service_rating character varying(20) COLLATE pg_catalog."default",
	CONSTRAINT userrating_reslocation_fk Foreign Key(place_id) References Reslocation(place_id),
	CONSTRAINT userrating_userprofile_fk Foreign Key(user_id) References userprofile(user_id)

)





#### Table name userpayment
CREATE TABLE public.UserPayment
(
    user_id character varying(20) COLLATE pg_catalog."default",
    payment character varying(20) COLLATE pg_catalog."default",
	CONSTRAINT userpayment_fk Foreign Key(user_id) References UserProfile(user_id)
)

##################################################################################################################################

#### Table Rehours
CREATE TABLE public.Rehours
(
    Place_id character varying(20) COLLATE pg_catalog."default",
    Hours character varying(20) COLLATE pg_catalog."default",
	CONSTRAINT rehours_fk Foreign Key(place_id) References Reslocation(place_id)
)

Create Table temp_Reshours
(Place_id varchar(50), Hours varchar(50),days varchar(20))

##################################################################################################################################




























