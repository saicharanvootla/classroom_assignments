use Recruitment
select * 
from ExternalCandidate

select cCandidateCode,vFirstName,vLastName,sitestscore
from ExternalCandidate

select cCandidateCode,vFirstName+vLastName,sitestscore
from ExternalCandidate
-- computed col with col heading
SELECT ccandidateCode, 'Name'=vFirstName+space(1)+vLastNAme, siTestScore
FROM externalcandidate

SELECT ccandidateCode, CandidateName=vFirstName+space(1)+vLastNAme, siTestScore
FROM externalcandidate

SELECT ccandidateCode, 'Candidate Name'=vFirstName+space(1)+vLastNAme, siTestScore
FROM externalcandidate

SELECT ccandidateCode, vFirstName+space(1)+vLastNAme 'Candidate Name' , siTestScore
FROM externalcandidate


--literal concatinated with col values
select 'names' + vfirstname,vlastname
from ExternalCandidate

--Arthmatic operations on col data
select ccandidatecode,vfirstname,vfirstname+vlastname,sitestscore,'newmarks'=sitestscore+10
from ExternalCandidate

---syntax check
---resource check
---performance optimization resources --index
---execution plan
---execute


---where clause
--note mssql is caseinsesitive by default
select ccandidatecode,vfirstname,vlastname,sitestscore
from ExternalCandidate
where vfirstname ='angela'

select ccandidatecode,vfirstname,vlastname,sitestscore
from ExternalCandidate
where ccandidatecode='000101'

select ccandidatecode,vfirstname,vlastname,sitestscore
from ExternalCandidate
where sitestscore=80

--<,>, <= ,>=,=, != ,<>
-- only one value is allowed on right hand side of the comparison operator
SELECT ccandidateCode, vFirstName, vLastNAme, siTestScore
FROM externalcandidate
where sitestscore>80 and sitestscore<90

select * from ExternalCandidate

-- get all candidates from the city Norton and Mentor

select * from ExternalCandidate
where ccity='Mentor' or ccity='Norton' 

select * from ExternalCandidate
where ccity='Norton' or ccity='Mentor'

--get all candidates from norton city with score grater than 90

select * from ExternalCandidate
where cCity='norton' and sitestscore<=90


-- 22+1
select * from ExternalCandidate
where ccity='Norton' and sitestscore<90

select * from ExternalCandidate
where not ccity='Norton'

select * from ExternalCandidate
where ccity != 'Norton'

-- between , in
select * from ExternalCandidate
where ccity='Norton' or ccity='Mentor' or ccity='Dublin' or ccity='seattle'

select * from ExternalCandidate
where ccity in( 'Norton' , 'Mentor' , 'Dublin' , 'seattle' )

select * from ExternalCandidate
where sitestscore>=80 and sitestscore <= 90

select * from ExternalCandidate
where sitestscore between 80 and 90

--like

select * from ExternalCandidate
where vaddress like '%street%'

select * from ExternalCandidate
where vaddress like '%street'

--candidates whose firstname starts wwith any letter
select * from ExternalCandidate
where vfirstname like 'a%'

--candidates whose code starts or ends with any number

select * from ExternalCandidate
where cCandidateCode like '%1_'

select * from ExternalCandidate
where cCandidateCode like '%1[268]'

select * from ExternalCandidate
where cCandidateCode like '%1[2-3]'

--candidates

select * from ExternalCandidate
where vfirstname like '[jab]%[ayh]'
SELECT DISTINCT ccity, cstate FROM ExternalCandidate
--null
select * from ExternalCandidate
where vEmailId is not null

--distinct
--distinct keyword can be used only once
--should be used immediately after select (first col)

select distinct ccity,cstate from ExternalCandidate
select distinct cstate ,ccity from ExternalCandidate

---order by

select * from ExternalCandidate

select cstate,ccity,ccandidatecode,vfirstname,vlastname,sitestscore 
from ExternalCandidate
order by cState,cCity,ccandidatecode

EXEC sp_help externalcandidate; 

create index idxstateexcan on externalcandidate(cstate,ccity)
SELECT cState 
FROM ExternalCandidate;
drop index idxstateexcan on externalcandidate

select cstate,ccity,ccandidatecode,vfirstname,vlastname,sitestscore 
from ExternalCandidate
order by cState,ccity desc

select ccandidatecode,vfirstname,sitestscore 
from ExternalCandidate
order by siTestScore desc

select top 10 percent ccandidatecode,vfirstname,sitestscore
from ExternalCandidate
order by sitestscore desc

select top 5 ccandidatecode,vfirstname,sitestscore
from ExternalCandidate
order by sitestscore desc

select top 5 ccandidatecode,vfirstname,sitestscore
from ExternalCandidate
order by sitestscore
--min max avg count

select sitestscore from ExternalCandidate

select max=max(sitestscore),min=min(sitestscore),count=count(sitestscore) from ExternalCandidate

select count=count(ccandidatecode),count(vemailid) from ExternalCandidate
select count=count(*) from ExternalCandidate

---group by
select cstate , 'no of candidates' = count(ccandidatecode) ,max=max(sitestscore), min=min(sitestscore), avg=avg(sitestscore)
from ExternalCandidate
where cstate in ('nevada','ohio','texas') and siTestScore>70
group by cState

select cstate , 'no of candidates' = count(ccandidatecode) ,max=max(sitestscore), min=min(sitestscore), avg=avg(sitestscore)
from ExternalCandidate
where siTestScore>70
group by cstate 
having cstate in ('nevada','ohio','texas')

select cstate , 'no of candidates' = count(ccandidatecode) ,max=max(sitestscore), min=min(sitestscore), avg=avg(sitestscore)
from ExternalCandidate
where cstate in ('nevada','ohio','texas')
group by cState
having count(ccandidatecode)>2

select *from ExternalCandidate
order by cState

select cstate,'no of candidates' = count(ccandidatecode)
from ExternalCandidate
group by cState

select cstate , 'no of candidates' = count(ccandidatecode) ,max=max(sitestscore), min=min(sitestscore), avg=avg(sitestscore)
from ExternalCandidate
group by cState

select cstate ,cCity, 'no of candidates' = count(ccandidatecode) ,max=max(sitestscore), min=min(sitestscore), avg=avg(sitestscore)
from ExternalCandidate
group by cState,cCity

---need for having

select cstate , 'no of candidates' = count(ccandidatecode) ,max=max(sitestscore), min=min(sitestscore), avg=avg(sitestscore)
from ExternalCandidate
where sitestscore>80
group by cState
having count(ccandidatecode)>=2

select cstate , 'no of candidates' = count(ccandidatecode) ,max=max(sitestscore), min=min(sitestscore), avg=avg(sitestscore)
from ExternalCandidate
group by cState
having avg(sitestscore)>=70


-----difference b/w having and where


select cstate , 'no of candidates' = count(ccandidatecode) ,max=max(sitestscore), min=min(sitestscore), avg=avg(sitestscore)
from ExternalCandidate
group by cState
having cstate in ('nevada','ohio','texas')

select cstate , 'no of candidates' = count(ccandidatecode) ,max=max(sitestscore), min=min(sitestscore), avg=avg(sitestscore)
from ExternalCandidate
where cstate in ('nevada','ohio','texas')
group by cState
SELECT * FROM ExternalCandidate;

SELECT * FROM RecruitmentAgencies;
SELECT cCandidateCode, vFirstName, vLastName, cAgencyCode
FROM ExternalCandidate  
WHERE cAgencyCode IS NOT NULL;
SELECT cCandidateCode, vFirstName, cName
FROM ExternalCandidate
INNER JOIN RecruitmentAgencies
ON ExternalCandidate.cAgencyCode = RecruitmentAgencies.cAgencyCode;
--get all candidate code and name with position name they have applied for
SELECT 
    ec.cCandidateCode,
    ec.vFirstName,
    p.vDescription AS PositionName
FROM ExternalCandidate ec
INNER JOIN Position p ON ec.cPositionCode = p.cPositionCode
ORDER BY ec.vLastName, ec.vFirstName;
--get all candidate code and name with name of there contractor

select ccandidatecode,vfirstname,cName
from ExternalCandidate
join ContractRecruiter
on ExternalCandidate.cContractRecruiterCode=ContractRecruiter.cContractRecruiterCode

--get all candidate code and name with the collage name
select ccandidatecode,vfirstname,cCollegeName
from ExternalCandidate
join College
on ExternalCandidate.cCollegeCode=College.cCollegeCode

select ccandidatecode, vfirstname, 
       'Candidate phone' = ExternalCandidate.cphone, 
       cname, 
       'Recruiter phone' = RecruitmentAgencies.cphone
from ExternalCandidate
join RecruitmentAgencies
on ExternalCandidate.cAgencyCode = RecruitmentAgencies.cAgencyCode
select ccandidatecode, vfirstname, cname, RecruitmentAgencies.cphone
from ExternalCandidate
join RecruitmentAgencies
on ExternalCandidate.cAgencyCode = RecruitmentAgencies.cAgencyCode
select ccandidatecode, vfirstname, cname, r.cphone
from ExternalCandidate e
join RecruitmentAgencies r
on e.cAgencyCode = r.cAgencyCode

---left join 
select ccandidatecode,vfirstname,cname,r.cphone
from ExternalCandidate e left outer join RecruitmentAgencies r
on e.cAgencyCode=r.cAgencyCode

---right join
select ccandidatecode,vfirstname,cname,r.cphone
from ExternalCandidate e right outer join RecruitmentAgencies r
on e.cAgencyCode=r.cAgencyCode
--get all candidate code and name with position name they have applied for show all data from externalcandidate table
select ccandidatecode,vfirstname ,vDescription
from ExternalCandidate left outer join Position
on ExternalCandidate.cPositionCode=Position.cPositionCode

--get all candidate code and name with name of there contractor show all data from both the table
select ccandidatecode,vfirstname,cName
from ExternalCandidate full join ContractRecruiter
on ExternalCandidate.cContractRecruiterCode=ContractRecruiter.cContractRecruiterCode

--get all candidate code and name with the collage name show all data from college table
select ccandidatecode,vfirstname,cCollegeName
from ExternalCandidate right outer join College
on ExternalCandidate.cCollegeCode=College.cCollegeCode

update employee
set cSupervisorCode='000001'
where cEmployeecode like '%[5-9]'

update employee
set cSupervisorCode='000002'
where cEmployeecode like '%[3-4]'

update employee
set cSupervisorCode='000001'
where cEmployeecode like '%[2]'

update employee
set cSupervisorCode='000003'
where cEmployeecode like '%1[1-2]'
select 
  "Employee" = emp.vFirstName + space(1) + emp.vLastName, 
  "Superior" = supr.vFirstName + space(1) + supr.vLastName
from employee emp
join employee supr
on emp.cSupervisorCode = supr.cEmployeeCode;

select ccandidatecode,p.cpositioncode
from ExternalCandidate e
cross join Position p
order by cCandidateCode

--Subquery
--get all candidates having same rating as that of 'Angela'
select cRating from ExternalCandidate
where vFirstName = 'Angela';

select cCandidatecode, vfirstname, vlastname
from ExternalCandidate
where cRating = 8;

select cCandidatecode, vfirstname, vlastname
from ExternalCandidate
where cRating = (
    select cRating from ExternalCandidate 
    where vFirstName = 'Angela'
);

--join substitute
select e.cCandidatecode, e.vfirstname, e.vlastname
from ExternalCandidate e
join ExternalCandidate o
on e.cRating = o.cRating
where o.vFirstName = 'Angela';

select cCandidatecode, vfirstname, vlastname
from ExternalCandidate
where cRating = (
    select cRating from ExternalCandidate 
    where vFirstName = 'Angela'

);
SELECT cCandidatecode, vfirstname, vlastname, cRating
FROM ExternalCandidate
WHERE cRating IN (
    SELECT cRating
    FROM ExternalCandidate
    WHERE vFirstName IN ('David', 'Angela')
);
SELECT *
FROM ExternalCandidate
WHERE sitestscore > ALL (
    SELECT sitestscore
    FROM ExternalCandidate
    WHERE vfirstname IN ('Angela', 'Barbara')
);
SELECT *
FROM ExternalCandidate
WHERE sitestscore > (
    SELECT MAX(sitestscore)
    FROM ExternalCandidate
    WHERE vfirstname IN ('Angela', 'Barbara')
);
SELECT *
FROM ExternalCandidate
WHERE sitestscore > ANY (
    SELECT sitestscore
    FROM ExternalCandidate
    WHERE vfirstname IN ('Angela', 'Barbara')
);
SELECT *
FROM ExternalCandidate
WHERE sitestscore > (
    SELECT MIN(sitestscore)
    FROM ExternalCandidate
    WHERE vfirstname IN ('Angela', 'Barbara')
);
select e.ccandidatecode,e.vfirstname,e.vlastname
from ExternalCandidate e
join ExternalCandidate o
on e.cRating=o.cRating
where o.vFirstName='angela'

select e.ccandidatecode,e.vfirstname,e.vlastname,o.cRating
from ExternalCandidate e
join ExternalCandidate o
on e.cRating=o.cRating
where o.vFirstName='david' or o.vFirstName='angela'

--all
select * from ExternalCandidate
where sitestscore>
(select max(sitestscore) from ExternalCandidate
where vfirstname='angela' or vfirstname='barbara')

select * from ExternalCandidate
where sitestscore>all
(select sitestscore from ExternalCandidate
where vfirstname='angela' or vfirstname='barbara')


---> any min
select * from ExternalCandidate
where sitestscore>any
(select sitestscore from ExternalCandidate
where vfirstname='angela' or vfirstname='barbara')

select * from ExternalCandidate
where sitestscore>any
(select min(sitestscore) from ExternalCandidate
where vfirstname='angela' or vfirstname='barbara')