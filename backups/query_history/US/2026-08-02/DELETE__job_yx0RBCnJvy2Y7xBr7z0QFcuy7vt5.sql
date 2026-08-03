-- job_id: job_yx0RBCnJvy2Y7xBr7z0QFcuy7vt5
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:18.258000+00:00
-- started: 2026-08-02T05:46:18.609000+00:00
-- ended: 2026-08-02T05:46:19.519000+00:00

DELETE FROM `Linkedin_Campaigns` WHERE `Linkedin_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `Linkedin_Campaigns_2314eaa1_f579_4a8a_8452_8838be91329e` AS main_table_alias)
