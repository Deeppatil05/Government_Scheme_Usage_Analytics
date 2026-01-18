---Note: The dataset used in this project is synthetic and created for analytical demonstration purposes.


create table states(
  state_id serial primary key,
  state_name text not null unique
);

select * from states

insert into states(state_name)
values
('Maharashtra'),
('Karnataka'),
('Gujarat'),
('Tamilnadu'),
('Uttar Pradesh');

-----


create table districts(
 district_id serial primary key,
 district_name text not null,
 state_id int not null,
 is_rural_majority boolean not null,
 constraint fk_state
   foreign key (state_id)
   references states(state_id)
);

select * from districts

insert into districts(district_name,state_id,is_rural_majority)
values
('Pune', 1, false),
('Kolhapur', 1,true),
('Mumbai' , 1, false),
('Nashik', 1, false),
('Solapur',1, true);

--------

create table schemes(
 scheme_id serial primary key,
 scheme_name text not null unique,
 category text not null,
 target_group text not null,
 launch_year int not null,
 is_active boolean not null
);

select * from schemes

insert into schemes(scheme_name,category,target_group, launch_year,is_active)
values
('PM-Kisan', 'Agriculture','Farmers',2019, TRUE),
('Ayushman Bharat','Health','General Public',2018,TRUE),
('Beti Bachao Beti Padhao','Educaion','Girls',2015, TRUE),
('MGNREGA','Employment','Rural Households', 2005, TRUE),
('Pradhan Mantri Awas Yojana','Housing','Low Income',2015,TRUE);


----

create table beneficiaries(
 beneficiary_id uuid primary key,
 full_name text not null,
 gender text not null,
 date_of_birth date not null,
 district_id int not null,
 registration_date date not null,
 is_active boolean not null,
 constraint fk_districts
  foreign key (district_id)
  references districts(district_id)
);

select * from beneficiaries

INSERT INTO beneficiaries (beneficiary_id, full_name, gender, date_of_birth, district_id, registration_date, is_active)
SELECT
    md5(random()::text || clock_timestamp()::text)::uuid,  -- generate pseudo UUID
    'Beneficiary_' || gs,
    CASE WHEN random() < 0.5 THEN 'Male' ELSE 'Female' END,
    (DATE '1960-01-01' + (random() * 20000)::int),
    (1 + (random() * 4)::int),
    (DATE '2015-01-01' + (random() * 3000)::int),
    TRUE
FROM generate_series(1, 1000) AS gs;


-----

create table demographics(
 demographic_id serial primary key,
 beneficiary_id uuid not null unique,
 caste_category text not null,
 income_bracket text not null,
 education_level text not null,
 is_rural boolean not null,
 constraint fk_beneficiary
  foreign key (beneficiary_id)
  references beneficiaries(beneficiary_id)
);

INSERT INTO demographics (beneficiary_id, caste_category, income_bracket, education_level, is_rural)
SELECT
 b.beneficiary_id, ---links demographic to beneficiaries
 case
  when random() < 0.15 then 'SC'
  when random() < 0.30 then 'ST'
  when random() < 0.60 then 'OBC'
  else 'General'
 end as caste_category,
 case
  when random() < 0.40 then 'Low'
  when random() < 0.85 then 'Middle'
  else 'High'
 end as income_bracket,
  case
    when random() < 0.20 then 'No formal education'
    when random() < 0.50 then 'Primary'
    when random() < 0.80 then 'Secondary'
  else 'Graduate'
 end as education_level,
 d.is_rural_majority  ---pulls directly from district.is_rural_majority
 from beneficiaries b    ---joins beneficiary to district(ensure data integrity)
 join districts as d 
 on
 b.district_id = d.district_id;
 
select * from demographics 
select * from demographics limit 10;

-----


create table scheme_enrollments(
 enrollment_id serial primary key,
 beneficiary_id uuid not null,
 scheme_id int not null,
 enrollment_date date not null,
 exit_date date,
 satus text not null,
 constraint fk_beneficiary
  foreign key (beneficiary_id)
  references beneficiaries(beneficiary_id),
 constraint fk_scheme
  foreign key (scheme_id)
  references schemes(scheme_id),
 constraint uq_beneficiary_scheme
  unique (beneficiary_id , scheme_id)
);


INSERT INTO scheme_enrollments (beneficiary_id, scheme_id, enrollment_date, exit_date, satus)
SELECT
 b.beneficiary_id,
 s.scheme_id,
 (b.registration_date + (random() * 365 * 3)::int)::date as enrollment_date,
 case
  when random() < 0.2 then (b.registration_date + (random() * 365 * 2)::int)::date
  else null
 end as exist_date,
 case 
  when random() < 0.7 then 'Active'
  when random() < 0.9 then 'Completed'
  else 'Dropped'
 end as status
 
from beneficiaries as b 
join schemes as s
on
random() < 0.3;  ---approx 30% chance a beneficiary enrolls in each schme

select * from scheme_enrollments

-----

create table fund_allocations(
 allocation_id serial primary key,
 scheme_id int not null,
 financial_year text not null,
 allocated_amount numeric (15,2) not null,
 constraint fk_scheme
  foreign key (scheme_id)
  references schemes(scheme_id),
 constraint uq_scheme_year
  unique (scheme_id,financial_year)
);

insert into fund_allocations(scheme_id,financial_year,allocated_amount)
select 
 s.scheme_id,
 '2022-23' as financial_year,
 round((5000000 + random() * 4000000)::numeric,2) as allocated_amount
from schemes as s;

select * from fund_allocations

-----

create table fund_utilization(
 utilization_id serial primary key,
 scheme_id int not null,
 district_id int not null,
 utilization_date date not null,
 utilized_amount numeric (15,2) not null,
 constraint fk_scheme
  foreign key (scheme_id)
  references schemes(scheme_id),
 constraint fk_district
  foreign key (district_id)
  references districts(district_id)
);

INSERT INTO fund_utilization (
    scheme_id,
    district_id,
    utilization_date,
    utilized_amount
)
SELECT
    s.scheme_id,
    d.district_id,
    (DATE '2022-04-01' + (random() * 365)::int)::date AS utilization_date,
    ROUND(
        (fa.allocated_amount * (0.1 + random() * 0.1))::numeric,
        2
    ) AS utilized_amount
FROM generate_series(1, 500) gs
JOIN schemes s
    ON TRUE
JOIN fund_allocations fa
    ON s.scheme_id = fa.scheme_id
JOIN districts d
    ON TRUE;

SELECT COUNT(*) FROM fund_utilization;



                     --***Business Questions***--

-- QUE1.How much money was allocated vs how much was actually utilized across all government schemes?

select 
  sum(fa.allocated_amount) as total_allocated_funds,
  sum(fu.utilized_amount) as total_utilized_funds
from fund_allocations as fa
join fund_utilization as fu
on
fa.scheme_id = fu.scheme_id;

select count(*) from fund_allocations;
select count(*) from fund_utilization;

--Que2.Which government schemes are efficiently utilizing their allocated funds and which are underperforming?

select 
 s.scheme_name,
 sum(fa.allocated_amount) as total_allocated,
 sum(fu.utilized_amount) as total_utilized,
 round (
 ( sum(fu.utilized_amount) / sum(fa.allocated_amount))* 100,2)
 as utilization_percentage
 
from schemes as s
 join fund_utilization as fu
 on s.scheme_id = fu.scheme_id
 join fund_allocations as fa
 on s.scheme_id = fa.scheme_id
 group by s.scheme_name
 order by utilization_percentage desc;
 

--Que3.Which districts are utilizing government funds effectively and which are lagging behind?

select
 d.district_name,
 sum(fu.utilized_amount) as total_utilized_funds
from districts as d
join fund_utilization as fu
on d.district_id = fu.district_id
group by d.district_name
order by total_utilized_funds desc;


--Que4.Which districts are more efficient in utilizing funds relative to the schemes implemented within them?


select
 d.district_name,
 sum(fu.utilized_amount) as total_utilized,
 sum(fa.allocated_amount) as total_allocated,
 round((sum(fu.utilized_amount)/ sum(fa.allocated_amount)) * 100,2)
 as utilization_efficiency_percentage
from districts as d
join fund_utilization as fu
on d.district_id = fu.district_id
join fund_allocations as fa
on fu.scheme_id = fa.scheme_id
group by district_name
order by utilization_efficiency_percentage;


--Oue5.Identify Under-Utilized Schemes (Critical KPI)

select
 s.scheme_name,
 sum(fa.allocated_amount) as total_allocated,
 sum(fu.utilized_amount) as total_utilized,
 round(( sum(fu.utilized_amount)/ sum(fa.allocated_amount)) *100,2)
 as utilization_percentage
from schemes as s
join fund_allocations as fa
on s.scheme_id = fa.scheme_id
join fund_utilization as fu
on fa.scheme_id = fu.scheme_id
group by s.scheme_name
having ( sum(fu.utilized_amount)/ sum(fa.allocated_amount)) < 0.15
order by utilization_percentage asc;


--Que6.Districts at Financial Execution Risk
--Districts with low utilization despite high allocation indicate:-Execution bottlenecks -Staffing or governance gaps


select
    d.district_name,
    sum(fa.allocated_amount) / (select count(*) from districts)
        as derived_allocated,
    sum(fu.utilized_amount) as total_utilized,
    round(
        (sum(fu.utilized_amount) /
        (sum(fa.allocated_amount) / (select count(*) from districts))) * 100,
        2
    ) as utilization_percentage
from districts d
join fund_utilization fu
    on d.district_id = fu.district_id
join fund_allocations fa
    on fu.scheme_id = fa.scheme_id
group by d.district_name
order by utilization_percentage desc;


--Que7.Scheme Stability Index (Advanced Metric)
--Identify schemes with consistent utilization behavior(Stable execution is valued more than spikes)

select
 s.scheme_name,
 round(stddev(fu.utilized_amount),2) as utilization_volatility,
 case
  when stddev(fu.utilized_amount) <= 180000 then 'Stable Spending'
  else 'Inconsistent spending'
 end as spending_category
from schemes as s
join fund_utilization as fu
on s.scheme_id = fu.scheme_id
group by s.scheme_name
order by utilization_volatility asc;

/*STDDEV = Volatility / Stability
We calculated standard deviation of utilized_amount across all transactions.
Low STDDEV → predictable / stable spending
High STDDEV → variable / inconsistent spending
STDDEV for volatility:- Converts raw numeric data into a stability metric.*/


---Scheme Utilization
CREATE OR REPLACE VIEW scheme_utilization AS
SELECT
    s.scheme_name,
    SUM(fa.allocated_amount) AS total_allocated,
    SUM(fu.utilized_amount) AS total_utilized,
    ROUND((SUM(fu.utilized_amount)/SUM(fa.allocated_amount))*100,2) AS utilization_percentage
FROM schemes s
JOIN fund_allocations fa ON s.scheme_id = fa.scheme_id
JOIN fund_utilization fu ON fa.scheme_id = fu.scheme_id
GROUP BY s.scheme_name
ORDER BY utilization_percentage DESC;

----District Utilization
CREATE OR REPLACE VIEW district_utilization AS
SELECT
    d.district_name,
    SUM(fu.utilized_amount) AS total_utilized,
    SUM(fa.allocated_amount)/ (SELECT COUNT(*) FROM districts) AS derived_total_allocated,
    ROUND((SUM(fu.utilized_amount)/ (SUM(fa.allocated_amount)/ (SELECT COUNT(*) FROM districts)))*100,2) 
	AS utilization_percentage
FROM districts d
JOIN fund_utilization fu ON d.district_id = fu.district_id
JOIN fund_allocations fa ON fu.scheme_id = fa.scheme_id
GROUP BY d.district_name
ORDER BY utilization_percentage DESC;

---Scheme Volatility & Spending Category View
CREATE OR REPLACE VIEW scheme_stability AS
SELECT
    s.scheme_name,
    ROUND(STDDEV(fu.utilized_amount),2) AS utilization_volatility,
    CASE 
        WHEN ROUND(STDDEV(fu.utilized_amount),2) <= 180000 THEN 'Stable Spending'
        ELSE 'Inconsistent Spending'
    END AS spending_category
FROM schemes s
JOIN fund_utilization fu ON s.scheme_id = fu.scheme_id
GROUP BY s.scheme_name
ORDER BY utilization_volatility ASC;


-- For scheme utilization
SELECT * FROM scheme_utilization;

-- For district utilization
SELECT * FROM district_utilization;

-- For scheme stability
SELECT * FROM scheme_stability;
