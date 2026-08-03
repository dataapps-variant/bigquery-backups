-- job_id: job_3nKC8BIQnUtq-CxHgKYNZRnIqs7x
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:17.474000+00:00
-- started: 2026-07-31T05:46:17.917000+00:00
-- ended: 2026-07-31T05:46:18.806000+00:00

DELETE FROM `Linkedin_Ads` WHERE `Linkedin_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `Linkedin_Ads_7f22d478_f49d_41ef_a1b6_662d837ec6ad` AS main_table_alias)
