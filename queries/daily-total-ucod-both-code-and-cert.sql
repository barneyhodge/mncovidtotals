/*
 * Daily totals of deaths where COVID is the underying cause of death on the code and the death certificate
 */

select death_date, count(*) from covid.deaths where 
	acme_unly_cause_dth = 'u071' 
	and
	(
		cause_of_death_line_d REGEXP 'SARS|COVID|CO-VID| 19 |SEASE 2019|VIRUS 2019' 
		or
		( cause_of_death_line_d = '' and cause_of_death_line_c REGEXP 'SARS|COVID|CO-VID| 19 |SEASE 2019|VIRUS 2019' ) 
		or
		( cause_of_death_line_c = '' and cause_of_death_line_b REGEXP 'SARS|COVID|CO-VID| 19 |SEASE 2019|VIRUS 2019' )
		or
		( cause_of_death_line_b = '' and cause_of_death_line_a REGEXP 'SARS|COVID|CO-VID| 19 |SEASE 2019|VIRUS 2019' )
	)   
group by death_date
order by death_date asc
