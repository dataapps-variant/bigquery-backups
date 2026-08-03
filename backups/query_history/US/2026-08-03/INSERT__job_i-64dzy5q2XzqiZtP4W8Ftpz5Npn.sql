-- job_id: job_i-64dzy5q2XzqiZtP4W8Ftpz5Npn
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:13.469000+00:00
-- started: 2026-08-03T05:46:13.634000+00:00
-- ended: 2026-08-03T05:46:14.387000+00:00

INSERT INTO `Linkedin_Campaigns` (`Id`, `AccountId`, `Locale_Country`, `CostType`, `Name`, `Type`) (SELECT main_table_alias.`Id`,main_table_alias.`AccountId`,main_table_alias.`Locale_Country`,main_table_alias.`CostType`,main_table_alias.`Name`,main_table_alias.`Type`  FROM `Linkedin_Campaigns_faddc979_7627_437f_99c2_a6098dc86239` AS main_table_alias LEFT JOIN `Linkedin_Campaigns` ON main_table_alias.`Id` = `Linkedin_Campaigns`.`Id` WHERE `Linkedin_Campaigns`.`Id` IS NULL)
