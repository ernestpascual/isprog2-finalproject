--- log in sql Applicant
select appEmail from jobTblApp
where appEmail = ' ' AND appPwd = ' '  ---fill spaces with variables in C#

--- log in sql Employer
select empEmail from jobTblEmp
where empEmail = ' ' AND empPwd = ' '

--- joining applicants, Industry and Location 
select * from jobTblApp A
inner join jobTblInd B ON A.appFkIndId = B.indId
inner join jobTblLoc C ON A.appFkLocId = C.locId

--- search what companies are in a specific industry 
select empComName as 'Companies' from jobTblEmp A
inner join jobTblInd B on A.empFkIndId = B.indId
where B.indName = 'Education' --- can be a variable name when in C#

--- jobOffer
-- step 1: create the views to collect all the ids. no need to execute the query, i already made 
-- this available in this database

create view vwjobApplicationIds
as
select A.appId, D.empId, B.indId, C.locId from jobTblApp A
inner join jobTblInd B on A.appFkIndId = B.indId
inner join jobTblLoc C on A.appFkLocId = C.locId
inner join jobTblEmp D on B.indId = D.empFkIndId

--- step 2: place them in the job application log, you can use this in C#
--- note to whoever is handling the backend, you can use in making a job query or application
--- inner join your tables to get the necessary date for the functionality
insert into jobTblJobApp (jobFkAppId,jobFkEmpId, jobFkIndId, jobFKLocId)
select * from vwjobApplicationIds


select * from jobTblJobApp











