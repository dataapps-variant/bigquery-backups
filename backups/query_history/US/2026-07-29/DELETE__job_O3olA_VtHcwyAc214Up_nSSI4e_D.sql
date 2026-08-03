-- job_id: job_O3olA_VtHcwyAc214Up_nSSI4e_D
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:24.553000+00:00
-- started: 2026-07-29T05:46:24.863000+00:00
-- ended: 2026-07-29T05:46:25.813000+00:00

DELETE FROM `Linkedin_Ads` WHERE `Linkedin_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `Linkedin_Ads_43802268_5dbd_4e45_a2dd_7e1d7f1df97b` AS main_table_alias)
