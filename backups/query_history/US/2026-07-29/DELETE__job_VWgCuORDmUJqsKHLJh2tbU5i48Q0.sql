-- job_id: job_VWgCuORDmUJqsKHLJh2tbU5i48Q0
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:21.772000+00:00
-- started: 2026-07-29T05:46:22.060000+00:00
-- ended: 2026-07-29T05:46:23.816000+00:00

DELETE FROM `Linkedin_Campaigns` WHERE `Linkedin_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `Linkedin_Campaigns_a48ff74f_9a10_408e_bd9c_108eec991ef2` AS main_table_alias)
