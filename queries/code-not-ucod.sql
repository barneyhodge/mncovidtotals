/*
 * All deaths with a COVID code (U071), but not as the underlying cause of death
 */

select count(*) from covid.deaths where
	acme_unly_cause_dth != ''
	and (
		rac_icd02 = 'U071'
		or rac_icd03 = 'U071'
		or rac_icd04 = 'U071'
		or rac_icd05 = 'U071'
		or rac_icd06 = 'U071'
		or rac_icd07 = 'U071'
		or rac_icd08 = 'U071'
		or rac_icd09 = 'U071'
		or rac_icd10 = 'U071'
		or rac_icd11 = 'U071'
		or rac_icd12 = 'U071'
		or rac_icd13 = 'U071'
		or rac_icd14 = 'U071'
		or rac_icd15 = 'U071'
		or rac_icd16 = 'U071'
		or rac_icd17 = 'U071'
		or rac_icd18 = 'U071'
		or rac_icd19 = 'U071'
		or rac_icd20 = 'U071'
	)
order by death_date desc
