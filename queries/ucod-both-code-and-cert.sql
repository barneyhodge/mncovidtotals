/*
 * Deaths where COVID is the underlying cause of death on both the code and the death certificate
 */

select count(*) from deaths where 
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
order by death_date asc
