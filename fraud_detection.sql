-- Create table for importing data
create table fraud (
	step int,
	type varchar(50),
	amount float,
	nameOrig varchar(50),
	oldbalanceOrg float,
	newbalanceOrig float,
	nameDest varchar(50),
	oldbalanceDest float,
	newbalanceDest float,
	isFraud varchar(1),
	isFlaggedFraud varchar(10)
)

-- View dataset
select *
from fraud;

-- Distribution of transaction types
select type, count(*) as volume
from fraud
group by type
order by volume desc;

-- Distribution of fraudulent and non-fraudulent transactions
select isFraud, count(*) as volume, 
		round(count(*)::numeric/ (select count(*) from fraud)*100, 2) as pct
from fraud
group by isFraud;

-- Distribution of fraudulent and non-fraudulent transactions by type
select type, isFraud, count(*) as volume
from fraud
group by type, isFraud;

-- Distribution of type of transactions that have are fraudulent
select type, count(*) as volume
from fraud
where isFraud = '1'
group by type;

-- Aggregation of amount for fraudulent and non-fraudulent transactions
select isFraud, round(sum(amount)::numeric,2), round(avg(amount)::numeric,2), min(amount), max(amount)
from fraud
group by isFraud;

-- Average change in source account balance for fraudulent transaction
select avg(oldbalanceOrg - newbalanceOrig) as average_balance_change
from fraud
group by isFraud;