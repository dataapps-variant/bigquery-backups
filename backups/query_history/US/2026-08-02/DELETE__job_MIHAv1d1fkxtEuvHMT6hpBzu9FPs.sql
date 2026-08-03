-- job_id: job_MIHAv1d1fkxtEuvHMT6hpBzu9FPs
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:15.334000+00:00
-- started: 2026-08-02T05:46:15.635000+00:00
-- ended: 2026-08-02T05:46:16.618000+00:00

DELETE FROM `Linkedin_Ads` WHERE `Linkedin_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `Linkedin_Ads_7eef2b38_f9dd_491a_a394_29b9e7477c61` AS main_table_alias)
