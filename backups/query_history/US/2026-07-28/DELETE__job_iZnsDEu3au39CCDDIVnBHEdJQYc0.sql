-- job_id: job_iZnsDEu3au39CCDDIVnBHEdJQYc0
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T05:46:26.977000+00:00
-- started: 2026-07-28T05:46:27.478000+00:00
-- ended: 2026-07-28T05:46:28.534000+00:00

DELETE FROM `Linkedin_Campaigns` WHERE `Linkedin_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `Linkedin_Campaigns_5a1dbfa5_e488_4e8b_9220_cbf449177f67` AS main_table_alias)
