/* Step 1:
The csv file is first loaded to pig to carry out the processing. */

INDATA1 = LOAD '/apprest/restaurantsfinal.csv' using org.apache.pig.piggybank.storage.CSVExcelStorage(',','YES_MULTILINE','UNIX','SKIP_INPUT_HEADER');

/* Step 2:
The values of ‘\n’, ‘\r’,’\t’ are replaced to empty space using the below query. */

OUTDATA1 = FOREACH INDATA1 GENERATE $0, $1, REPLACE($2,'\n|\r|\t','') ; 

/*Step 3:
The processed data is now stored in a different directory (/apprest/tb) under the same root using the below query. This file after processing will appear as  “part_m_0000” */

STORE OUTDATA1 INTO '/apprest/tb'
