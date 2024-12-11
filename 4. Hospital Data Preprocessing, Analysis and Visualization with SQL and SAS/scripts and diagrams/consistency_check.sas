/* Program to check for basic consistency in the transactional table, inconsistencies end up in deletion */

DATA CONSISTENT_TRANTABLE;
SET WORK.PREABT; /* File import */

/* Age has to be >0 */
IF (IMP_Age<0 OR IMP_Age=0) THEN DO;
	DELETE;
END;
/* 9867 -> 9724 */

/* Legal age for marriage in UK is 18, so any rows not respecting this is considered as an inncosistency */
IF (IMP_Age<18 AND NOT(Marital_Status='Single')) THEN DO;
	DELETE;
END;
/* 9724 -> 9719 */

/* School leaving age is legally defined to be 16, therefore anyone with age <=16 must be a student */
IF (IMP_Age<17 AND NOT(Profession='Student')) THEN DO;
	DELETE;
END;
/* 9719 -> 9610 */ 

/* Insurance coverage should be always smaller than consultation cost */
IF (Consultation_Price < IMP_Insurance_Coverage) THEN DO;
	DELETE;
END;
/* 9610 -> 9599*/

/* People without insurance should not have insurance coverage */
IF (IMP_INSURANCE_COVERAGE > 0 AND IMP_Insurance_Provider='None') THEN DO;
	DELETE;
END;
/* 9599 -> 9599 /*

/* Check professions according to their degree required
	Lawyer, Engineer, Scientist -> At least high school
	Others won't be checked as some of them might have more specific requirements 
*/
IF (
	(PROFESSION='Engineer' OR PROFESSION='Lawyer' or PROFESSION='Scientist') AND	
	NOT(IMP_Education_Level='PhD' or IMP_Education_Level='Master' or 
	IMP_Education_Level='Undergraduate' or IMP_Education_Level='High school')
) THEN DO;
	DELETE;
END;
/* 9599 -> 9599 */

/* Students should not have an income (we will not count cases of part-time jobs or irregular work) */
IF (PROFESSION='Student' AND IMP_Approximate_Annual_Income > 0) THEN DO;
	DELETE;
END;
/* 9599 -> 9599 */

/* Compare age with education level; exclusing exceptional cases of people who skipped grades, it should be that
	High School: must be at least 16, compulsory education ends at that age
	Undergraduate: must be at least 21 (three years to complete a BsC degree)
	Master's: must be at least 22 (in UK master's last one year)
	PhD: 25 (3 years)
	The rest won't be checked as the cases can vary 
*/
IF ( (IMP_EDUCATION_LEVEL='High school' AND IMP_AGE < 15 ) OR
	 (IMP_EDUCATION_LEVEL='Undergraduate' AND IMP_AGE < 20) OR
	 (IMP_EDUCATION_LEVEL='Master' AND IMP_AGE < 21) OR
	 (IMP_EDUCATION_LEVEL='PhD' AND IMP_AGE < 24 )
) THEN DO;
	DELETE;
END;
/* 9599 -> 9389 */

/* People who have a paying job should have an income */
IF NOT(PROFESSION='Student' or PROFESSION='Retired') AND IMP_APPROXIMATE_ANNUAL_INCOME=0 THEN DO;
	DELETE;
END;

/* 9389 -> 9389 */

/*
	RESULTS
	-------
	10 Queries
	9867 -> 9389 rows
	478 deleted rows
*/
IF ( PATIENT_ID=1488 AND NOT(PROFESSION='Student')) THEN DO;
		PROFESSION='Student';
END;

IF ( PATIENT_ID=1496 AND NOT(PROFESSION='Student')) THEN DO;
    PROFESSION='Student';
END;

IF ( PATIENT_ID=1050 AND NOT(GENDER='Female')) THEN DO;
    GENDER='Female';
END;

IF ( PATIENT_ID=1307 AND NOT(GENDER='Male')) THEN DO;
    GENDER='Male';
END;

IF ( PATIENT_ID=1349 AND NOT(GENDER='Male')) THEN DO;
    GENDER='Male';
END;

IF ( PATIENT_ID=1447 AND NOT(GENDER='Female')) THEN DO;
    GENDER='Female';
END;

IF ( PATIENT_ID=1490 AND NOT(GENDER='Female')) THEN DO;
    GENDER='Female';
END;

IF ( PATIENT_ID=1140 AND NOT(MARITAL_STATUS='Single')) THEN DO;
    MARITAL_STATUS='Single';
END;

IF ( PATIENT_ID=1322 AND NOT(MARITAL_STATUS='Single')) THEN DO;
    MARITAL_STATUS='Single';
END;

IF ( PATIENT_ID=1332 AND NOT(MARITAL_STATUS='Single')) THEN DO;
    MARITAL_STATUS='Single';
END;

IF ( PATIENT_ID=1382 AND NOT(MARITAL_STATUS='Single')) THEN DO;
    MARITAL_STATUS='Single';
END;

set PREABT;
format visit_date DTDATE.;
FORMAT
run;
