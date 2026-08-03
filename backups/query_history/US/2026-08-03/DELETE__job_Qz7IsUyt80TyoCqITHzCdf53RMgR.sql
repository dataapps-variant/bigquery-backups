-- job_id: job_Qz7IsUyt80TyoCqITHzCdf53RMgR
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:15.374000+00:00
-- started: 2026-08-03T05:46:15.696000+00:00
-- ended: 2026-08-03T05:46:16.602000+00:00

DELETE FROM `Linkedin_Campaigns` WHERE `Linkedin_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `Linkedin_Campaigns_bb56b304_6d4d_4157_8e90_ff2e781d7c1e` AS main_table_alias)
