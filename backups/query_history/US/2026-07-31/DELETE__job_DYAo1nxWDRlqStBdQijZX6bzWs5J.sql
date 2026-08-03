-- job_id: job_DYAo1nxWDRlqStBdQijZX6bzWs5J
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:20.500000+00:00
-- started: 2026-07-31T05:46:20.830000+00:00
-- ended: 2026-07-31T05:46:22.855000+00:00

DELETE FROM `Linkedin_Campaigns` WHERE `Linkedin_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `Linkedin_Campaigns_32e8246c_eb83_4b3e_af09_7729e62efac6` AS main_table_alias)
