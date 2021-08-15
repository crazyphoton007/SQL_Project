###########################################################################################################
copy userprofile  FROM 'D:\CSE460\project\archive_17\userprofile.csv' DELIMITER ',' csv
###########################################################################################################
copy Reslocation FROM 'D:\CSE460\project\archive_17\geoplaces2.csv' DELIMITER ',' csv
###########################################################################################################
copy temp_Recuisines FROM 'D:\CSE460\project\archive_17\chefmozcuisine.csv' DELIMITER ',' csv

Insert INTO Rescuisines 
Select Place_id, cuisines From temp_Recuisines where Place_id IN 
(select DISTINCT place_id from Reslocation)
###########################################################################################################

copy Respayment FROM 'D:\CSE460\project\archive_17\chefmozaccepts.csv' DELIMITER ',' csv as HEADER

############################################################################################################
copy temp_Reshours FROM 'D:\CSE460\project\archive_17\chefmozhours4.csv' DELIMITER ',' csv as HEADER
Insert INTO Reshours select place_id, hours from temp_Reshours where Place_id IN 
(select DISTINCT place_id from Reslocation) 

############################################################################################################

Insert INTO Resparking
Select Place_id, Parking_lot From temp_Resparking where Place_id IN 
(select DISTINCT place_id from Reslocation)
copy temp_Resparking FROM 'D:\CSE460\project\archive_17\chefmozparking.csv' DELIMITER ',' csv

#############################################################################################################

copy UserCuisine FROM 'D:\CSE460\project\archive_17\usercuisine.csv' DELIMITER ',' csv


#############################################################################################################

copy userRating FROM 'D:\CSE460\project\archive_17\rating_final.csv' DELIMITER ',' csv



