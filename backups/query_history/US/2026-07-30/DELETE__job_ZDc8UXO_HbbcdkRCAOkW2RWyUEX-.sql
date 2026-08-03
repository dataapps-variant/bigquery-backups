-- job_id: job_ZDc8UXO_HbbcdkRCAOkW2RWyUEX-
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:25.236000+00:00
-- started: 2026-07-30T05:46:25.574000+00:00
-- ended: 2026-07-30T05:46:26.640000+00:00

DELETE FROM `Linkedin_Campaigns` WHERE `Linkedin_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `Linkedin_Campaigns_2f7cb823_5a07_4f5c_80a6_0a68c7d0bcf0` AS main_table_alias)
