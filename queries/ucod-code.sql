/*
 * Deaths coded with COVID (U071) as the underlying cause of death
 */

select count(*) from covid.deaths where
	acme_unly_cause_dth = 'U071'
order by death_date asc
