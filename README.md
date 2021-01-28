# SUMMARY

Minnesota's 2020 death records shows that the COVID death totals reported by the Minnesota Department of Health are possibly inflated by nearly 30%. This repository is made availalbe in hopes that average citizens will examine the data for themselves, validate the queries, and make improvements or corrections as needed.

![Daily Deaths](https://github.com/barneyhodge/mncovidtotals/blob/main/charts//mn-2020-daily-deaths.png?raw=true)
![Cumulative Deaths](https://github.com/barneyhodge/mncovidtotals/blob/main/charts/mn-2020-cumulativate-deaths.png?raw=true)

# INTRODUCTION

This analysis attemps to answer two questions:

1. Are Minnesota's COVID 2020 death totals inflated (and if so, by how much)?
2. How do the daily COVID deaths reported by MDH coincide with the daily totals of actual COVID deaths?

# THE DATA

Death records are considered public in Minnesota, and those records are available in a comma-delimited text file from the Minnesota Department of Health (MDH) for a nominal fee. 

Each record in the file contains 296 fields; this analysis leverages a subset of the data, with all personaly-identifiable information (name, birthday, address, next of kin, etc.) and extraneous fields removed.

The fields used in the subset of the file are:

* st_file_nbr - MDH record ID
* decd_age_in_years - age of decedent
* death_date - actual date of death
* residence_nursing - flag to indicate if decedent was a nursing home resident (regarless of where they died)
* decd_death_county - county where death occurred
* ca_injury_or_trauma - indicates if death was due to injury or trauma
* ca_injury_or_trauma_describe - description of injury or trauma (if applicable)
* cause_of_death_line_a - line A from Part 1 of the death certificate
* cause_of_death_line_b - line B from Part 1 of the death certificate
* cause_of_death_line_c - line C from Part 1 of the death certificate
* cause_of_death_line_d - line D from Part 1 of the death certificate
* other_contributing_factors - information from Part 2 of the death certificate
* manner_of_death - indicates natural death or accident
* injury_date - date that accident/injury occurred (if applicable)
* date_filed_medical - date when certificate was filed medically
* date_filed_legal - date when certificate was filed legally
* rac_icd01 through rac_icd20 - medical codes that should correspond with the "cause of death" details listed on the death certificate
* acme_unly_cause_dth - code that specifices the underlying cause of death (same as rac_icd01)

While it's possible to examine this data with a spreadsheet, it's best to import this file into a database (e.g. MS Access or MySQL) to run queries.


# ANSWERING THE QUESTIONS

## 1. Are COVID deaths inflated?

When determining COVID deaths, it's important to understand the concept of the *"underlying cause of death" ("UCOD")*, which is [defined](https://medical-dictionary.thefreedictionary.com/underlying+cause+of+death) as "the disease or injury that initiated the train of morbid events leading directly to death, or the circumstances or violence that produced the fatal injury."

### UCOD ON THE DEATH CERTIFICATE

[According to the process defined by CDC](https://www.cdc.gov/Nchs/data/misc/hb_cod.pdf), when death certificates are completed, the causes of death are listed on lines A-D of Part 1, with the UCOD listed on the last line (e.g. if line A lists "HEART FAILURE" and line B lists "KIDNEY DISEASE," the UCOD is line B).

### UCOD FOR CODING

After a death certificate is entered into Minnesota's systems, it's sent to the National Health Statistics Center ("NHSC", a division of CDC) in Maryland, where they add medical codes that correspond to the death certificate details, including the code that indiciates the UCOD. The codes for COVID-19 are U07.1 and U07.2. _The coding process can take up to several weeks._ 

### CDC GUIDANCE ON CLASSIFYING COVID DEATHS

In April 2020, CDC [issued new guidelines](https://www.cdc.gov/nndss/conditions/coronavirus-disease-2019-covid-19/case-definition/2020/) to count any death where COVID was present or suspected as a COVID death, regardless of whether or not it's indicated as the UCOD on the death certificate.

### THE TOTALS FROM THE DEATH RECORDS 

* Deaths coded as "from COVID" (U07.1 as UCOD): 4,781
* Deaths coded as "with COVID" (U07.1 as a contributing cause of death but not UCOD): 639
* Deaths coded as "from COVID" (U07.1 as UCOD), but the UCOD listed on the death certificate does not match: 992

**Based on the death certificate details, 21% of deaths coded as "from COVID" are misclassified. Subtracting the disputed records rerturns an adjusted total of 3,789.**

_NOTE: there are 228 records where COVID is listed as the UCOD on the death certificatae, but codes have yet to be added by NHSC_

## Question 2: How do the MDH totals compare to the death records?

Because of delays in death certificate filings and coding, it appears that MDH unilaterally determines which deaths to include in the daily COVID death totals, and when to include them. The daily death totals reported by the MDH do not reflect actual deaths from the previous day (e.g. the most COVID deaths in one day, based on actual day of death, was 72 on December 3; MDH reported higher totals for 12 other days, including 101 on November 26. 

**The difference between the adjusted death total (3,789) and the total 2020 deaths reported by MDH (5,323) is 29%.**
