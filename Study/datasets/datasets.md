
# Fire Department Calls for Service
https://data.sfgov.org/Public-Safety/Fire-Department-Calls-for-Service/nuek-vuh3

Hive table creation
CREATE TABLE IF NOT EXISTS arpithivedb.fire_dept_calls
(
Call_Number BIGINT, Unit_ID BIGINT, Incident_Number BIGINT, Call_Type STRING, Call_Date DATE, Watch_Date DATE, Received_DtTm DATE, Entry_DtTm DATE, Dispatch_DtTm DATE, Response_DtTm DATE, On_Scene_DtTm DATE, Transport_DtTm DATE, Hospital_DtTm DATE, Call_Final_Disposition STRING, Available_DtTm DATE, Address STRING, City STRING, Zipcode_of_Incident STRING, Battalion STRING, Station_Area STRING, Box STRING, Original_Priority STRING, Priority STRING, Final_Priority STRING, ALS_Unit STRING, Call_Type_Group STRING, Number_of_Alarms BIGINT, Unit_Type STRING, Unit_sequence_in_call_dispatch STRING, Fire_Prevention_District STRING, Supervisor_District STRING, Neighborhooods_Analysis_Boundaries STRING, RowID BIGINT, case_location STRING, Analysis_Neighborhoods STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' lines terminated BY '\n' tblproperties("skip.header.line.count"="1"); 

Load data into Hive
LOAD DATA LOCAL INPATH '/Users/arpitjain/Downloads/Fire_Department_Calls_for_Service.csv' OVERWRITE INTO TABLE arpithivedb.fire_dept_calls;
