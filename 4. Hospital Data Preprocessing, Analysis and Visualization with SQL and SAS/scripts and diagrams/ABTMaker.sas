PROC SQL;
CREATE TABLE BIO_INFO AS
	SELECT DISTINCT PATIENT_ID, GENDER, PROFESSION, FAMILY_HISTORY, CITY_OF_RESIDENCE, MARITAL_STATUS, IMP_INSURANCE_PROVIDER
	FROM WORK.PREABTCONSISTENT /* IMPORTANT !!! */
	GROUP BY PATIENT_ID;
RUN; 
/* ^^ Directly transposes some biographical/anagraphical information ^^ */
	/* such as gender, profession, family history, which are supposed to be unique. */

/* ======================================================== */
CREATE TABLE AGE AS
	SELECT DISTINCT PATIENT_ID, avg(IMP_Age) as Age
	FROM WORK.PREABTCONSISTENT
	GROUP BY PATIENT_ID;
RUN;
/* As there are inconsitencies in the imputed ages, we will simply take their average */ 
/* ======================================================== */

PROC SQL;
CREATE TABLE STEP1 AS
	SELECT X.PATIENT_ID, X.DEPARTMENT, (sum(X.Consultation_Price)/T.MON) as TotAmt
	FROM WORK.PREABTCONSISTENT as X, (
		SELECT PATIENT_ID, sum(AUX.CONSULTATION_PRICE) as MON
		FROM WORK.PREABTCONSISTENT AS AUX
		GROUP BY AUX.PATIENT_ID) as T
	WHERE T.PATIENT_ID = X.PATIENT_ID
	GROUP BY X.PATIENT_ID, X.DEPARTMENT;
RUN;

PROC SORT DATA=STEP1 OUT=STEP2;
	BY PATIENT_ID;
RUN;

PROC TRANSPOSE DATA=STEP2 OUT=SEGMENTED_PRICE
	PREFIX=proportion_price_;
	ID DEPARTMENT;
	BY PATIENT_ID;
RUN;

/* ^^ Segments total consultation price by department in form of proportion ^^ */

/* ======================================================== */
PROC SQL;
CREATE TABLE STEP1 AS
	SELECT PATIENT_ID, DEPARTMENT, count(*) as Freq
	FROM WORK.PREABTCONSISTENT
	GROUP BY PATIENT_ID, DEPARTMENT;
RUN;

PROC SORT DATA=STEP1 OUT=STEP2;
	BY PATIENT_ID;
RUN;

PROC TRANSPOSE DATA=STEP2 OUT=SEGMENTED_FREQ
	PREFIX=freq_;
	ID DEPARTMENT;
	BY PATIENT_ID;
RUN;
/* ^^ same as above but with frequency */

/* ======================================================== */
proc sql;
CREATE TABLE MEMBERSHIP AS
	select distinct PATIENT_ID, (DATETIME()-min(Visit_Date))/86400 as membership_days
	from WORK.PREABTCONSISTENT
	group by PATIENT_ID;
run;

/* ======================================================== */
proc sql;
CREATE TABLE RECENCY AS
	select distinct PATIENT_ID, (DATETIME()-max(Visit_Date))/86400 as recency_days
	from WORK.PREABTCONSISTENT
	group by PATIENT_ID;
run;
/* Get recency */

/* ======================================================== */
PROC SQL;
CREATE TABLE AGGREGATED_INFO AS
	SELECT PATIENT_ID, 
		avg(Consultation_Duration) as avg_duration, 
		avg(Satisfaction_Level) as avg_Satisfaction_Level, 
		sum(Consultation_Price) as monetary, 
		avg(IMP_Approximate_Annual_Income) as avg_recorded_income,
		count(*) as total_frequency
	FROM WORK.PREABTCONSISTENT
	GROUP BY PATIENT_ID;
RUN;

PROC SQL;
CREATE TABLE SAT_LEV AS
	SELECT PATIENT_ID, 
		avg(Satisfaction_Level) as avg_Satisfaction_Level
	FROM WORK.PREABTCONSISTENT
	WHERE Satisfaction_Level < 6
	GROUP BY PATIENT_ID;
RUN;

/* Get important aggregated variables*/
	/* Namely: -total amount of money spent; -mode of department; -satisfaction, duration, ANI avg. */

/* ======================================================== */
PROC SQL;
CREATE TABLE PROPORTION_COVERAGE AS
	SELECT DISTINCT X.PATIENT_ID, sum(X.IMP_Insurance_Coverage)/T.MON as CoverageProportion
	FROM WORK.PREABTCONSISTENT as X, (
		SELECT PATIENT_ID, sum(AUX.CONSULTATION_PRICE) as MON
		FROM WORK.PREABTCONSISTENT AS AUX
		GROUP BY AUX.PATIENT_ID) as T
	WHERE T.PATIENT_ID = X.PATIENT_ID
	GROUP BY X.PATIENT_ID
;
RUN;




/* ======================================================== */
DATA PRE_FINAL;
	MERGE BIO_INFO AGE PROPORTION_COVERAGE SEGMENTED_PRICE SEGMENTED_FREQ RECENCY MEMBERSHIP SAT_LEV AGGREGATED_INFO;
	BY PATIENT_ID;
RUN;

DATA PRE_PRE_FINAL;
	SET PRE_FINAL;
	DROP _NAME_;
RUN;

DATA FINAL_ABT;
	SET PRE_PRE_FINAL;
	ARRAY change _numeric_;
		DO OVER change;
		IF change=. THEN change=0;
	END;
RUN;

DATA FINAL_ABT;
	SET FINAL_ABT;
IF ( 
	PATIENT_ID in(
1013,
1014,
1015,
1028,
1031,
1034,
1089,
1092,
1100,
1105,
1135,
1143,
1234,
1245,
1248,
1260,
1261,
1266,
1285,
1294,
1302,
1308,
1317,
1340,
1343,
1381,
1449,
1455,
1485,
1490,
1498
)
)
THEN DO;
	DELETE;
END;
	

/* Finalize ABT and get done with first part */
