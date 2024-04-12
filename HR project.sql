Create database HR;
use hr;
Select count(*) from `hr data`;

#Attrition number
select Department, count(`Employee Number`) as Employee from `hr data`
where attrition = "Yes"
group by Department
Order by employee asc;
    
#--------------------------kpi1---------------------------------
SELECT department, 
    round(COUNT(CASE WHEN attrition = "yes" then 1 end ) * 100.0 / COUNT(*),2) AS attrition_rate
FROM 
    `hr data`
 group by Department
Order by attrition_rate asc ;
 
 
 #----------------------kpi2----------------------

Select round(avg(`Hourly Rate`),2) as Hourly_rate_male_Reseach_scientist from `hr data`
where `Job Role` = "Research Scientist" and Gender = "Male";

 #----------------------kpi3----------------------

select (CASE WHEN `Monthly Income` <= 5000 then "0-5k"
when `Monthly Income` <= 10000  then "6k-10k"
when `Monthly Income` <= 15000 then "11k-15k"
else "16k-20k" 
 end )as Monthly_income , 
 round(COUNT(CASE WHEN attrition = "yes" then 1 end ) * 100.0 / COUNT(*),2) AS attrition_rate
 from `hr data`
 group by Monthly_income
 order by field(Monthly_income,"0-5k","6k-10k","11k-15k","16k-20k" );

 #----------------------kpi4----------------------
 

 Select Department, Round(avg(`Years At Company`),2) as Average_working_years from `hr data`
 group by department
 order by department asc;
 

  #----------------------kpi5----------------------
 
 Select Department, count(`Employee Number`) as employees from `hr data`
 group by department
 order by employees desc ;

#----------------------kpi6------------------------


 Select `Education Field`, count(`Employee Number`) as employees from `hr data`
 group by `Education Field`
 order by employees desc ;

#----------------------kpi7------------------------

Select `Job Role`,
(case when  `Work Life Balance` =1 then 1
when  `Work Life Balance` =2 then 2
when  `Work Life Balance` =3 then 3
when  `Work Life Balance` =4 then 4
else 5
end) as work_life_balance_rank,
count(`Work Life Balance`) as work_life_balance
from `hr data`
group by work_life_balance_rank,`Job Role`
order by `Job Role`,work_life_balance_rank;


#----------------------kpi8------------------------


select (CASE WHEN `Years Since Last Promotion` <= 3 then "0-3 years"
when `Years Since Last Promotion`<= 6 then "4-6 years"
when `Years Since Last Promotion`<= 9 then "7-9 years"
when `Years Since Last Promotion` <= 12 then "10-12 years"
when `Years Since Last Promotion` <= 15 then "13-15 years" 
else "16+ years"
 end )as years_since_last_promotion, 
 round(COUNT(CASE WHEN attrition = "yes" then 1 end ) * 100.0 / COUNT(*),2) AS attrition_rate
 from `hr data`
 group by years_since_last_promotion
  order by field(years_since_last_promotion,"0-3 years","4-6 years","7-9 years","10-12 years","13-15 years","16+ years" );


#----------------------kpi9------------------------

Select gender, round((count(`Employee Number`)*100.0)/1470,2) from `hr data`
group by gender;

#----------------------kpi11------------------------
Select `Job Role`,
(case when  `Job Satisfaction` =1 then 1
when  `Job Satisfaction` =2 then 2
when  `Job Satisfaction` =3 then 3
when  `Job Satisfaction` =4 then 4
else 5
end) as Job_Satisfaction_rank,
count(`Job Satisfaction`) as Job_Satisfaction
from `hr data`
group by Job_Satisfaction_rank,`Job Role`
order by `Job Role`,Job_Satisfaction_rank;

#----------------------kpi12------------------------
#Employees count who does over time in each job role
Select `Job Role`, count(`Over Time`="yes") as Employee from `hr data`
group by `Job Role`
order by Employee desc;


#----------------------kpi13------------------------

select `Job Role`,round(avg(`Years Since Last Promotion`),2) As Average_years_since_last_promoted from `hr data`
group by `Job Role`
order by Average_years_since_last_promoted asc;


#----------------------kpi14------------------------
Select `Business Travel`, round(avg(`Job Satisfaction`),2) as Average_job_satisfaction from `hr data`
group by`Business Travel` ;

