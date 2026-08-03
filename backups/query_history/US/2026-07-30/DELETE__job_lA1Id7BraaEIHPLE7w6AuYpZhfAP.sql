-- job_id: job_lA1Id7BraaEIHPLE7w6AuYpZhfAP
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:20.128000+00:00
-- started: 2026-07-30T05:46:20.624000+00:00
-- ended: 2026-07-30T05:46:21.588000+00:00

DELETE FROM `Linkedin_Ads` WHERE `Linkedin_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `Linkedin_Ads_4f70481f_64d3_4fe7_afec_8a82b04eb12e` AS main_table_alias)
