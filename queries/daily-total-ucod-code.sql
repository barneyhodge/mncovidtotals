/*
 * Daily totals of deaths coded with COVID as the underlying cause of death
 */

select death_date, count(*) from covid.deaths where
	acme_unly_cause_dth = 'U071'
group by death_date
order by death_date asc
