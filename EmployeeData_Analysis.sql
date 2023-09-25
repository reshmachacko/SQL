use project;
select * from employee;

# 1. Fetch out the details of employees who have PHD
select * from employee 
where education='PHD';

# 2. Calcualte the count of empoyees who are kept out of projects for 1 month or more and the count of employees those are not
select EverBenched ,count(EverBenched) 
from employee 
group by EverBenched;

# 3. Fetch the details of female employees who are from  banglore and LEAVES THE COMPANY IN NEXT 2 YEARS
select * from employee 
where City='Bangalore' 
and Gender='Female' 
and LeaveOrNot=1;

# 4. Fetch the details of employees who have age equal to the youngest employee
select * from employee 
where age=(select min(age) from employee);

# 5. calculate the average payment tier based on the education level
select education, avg(PaymentTier) 
from employee 
group by education;

# 6. Find the details of the youngest and eldest employee who have joined in 2016
select * from employee 
where (age=(select min(age) from employee) 
or age=(select max(age) from employee)) 
and JoiningYear=2016 
order by age ;

# 7. Calculate the education vise count of employees having experience in current domain greater than or equal to 3
select education,count(*) as count 
from employee 
where ExperienceInCurrentDomain >= 3 
group by education ;

# 8. Find the employees from pune who have more experience in the current domain than the average experience in the current domain
select * from employee 
where city='Pune' 
and ExperienceInCurrentDomain > (select avg(ExperienceInCurrentDomain) from employee);

# 9. Find the cities where the average age of employees is above the overall average age of all employees
select city from employee 
group by city 
having avg(age) >(select avg(age) from employee);

# 10. Count the number of male and female employees in each city who have a payment tier of 3 or higher
select city,gender, count(*) as employeecount 
from employee 
where PaymentTier>=3 
group by city,gender;

