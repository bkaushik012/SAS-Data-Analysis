/* Assign a name to the library */
libname your_lib '/home/u63592215/STAT 342/Final Project';

data your_lib.Adult;
  infile '/home/u63592215/STAT 342/Final Project/adult.data' dlm=',' truncover;
  input 
     age workclass $ fnlwgt education $ education_num marital_status $ 
     occupation $ relationship $ race $ sex $ capital_gain capital_loss 
     hours_per_week native_country $ income $;
  format 
     age 3. 
     workclass $20. /* Adjusted width to 20 */
     fnlwgt 10. 
     education $20. 
     education_num 5. 
     marital_status $20. 
     occupation $20. 
     relationship $20. 
     race $10. 
     sex $6. 
     capital_gain 8. 
     capital_loss 8. 
     hours_per_week 3. 
     native_country $20. 
     income $6.;
run;

/*Example Code Using Proc Tabulate*/
proc tabulate data=your_lib.Adult; class education income; var hours_per_week; 
table education, income*hours_per_week*(mean) / printmiss; 
title 'Average Hours Worked per Week by Education and Income'; 
run; 

/* Example SAS Code for a Complex Table using PROC TABULATE */
proc tabulate data=your_lib.Adult; class education income;var hours_per_week; table 	
education,income*hours_per_week*(mean='Mean' sum='Sum' n='Count')*f=comma9.2 / 	printmiss;
title 'Complex Table of Hours Worked per Week by Education and Income'; 
run; 


proc sgplot data=your_lib.Adult;
   scatter x=age y=hours_per_week / group=income;
   title 'Scatter Plot of Age and Hours per Week by Income';
   xaxis label='Age';
   yaxis label='Hours per Week';
   legend 'Income' / title='Income Categories';
run;


/* Example SAS Code using PROC SGPLOT */
proc sgplot data=your_lib.Adult;
  vbar education / group=income response=hours_per_week stat=mean;
  title 'Average Hours Worked per Week by Education Level and Income';
  xaxis label='Education Level';
  yaxis label='Average Hours per Week';
run;

proc sgplot data=your_lib.Adult;
   title 'Box Plot of Hours Worked per Week by Education Level and Gender (Above Grade 12)';
   xaxis label='Education Level';
   yaxis label='Hours per Week';
   hbox hours_per_week / category=education group=sex;
   where education_num > 12; /* Filter for education levels above grade 12 */
run;




















