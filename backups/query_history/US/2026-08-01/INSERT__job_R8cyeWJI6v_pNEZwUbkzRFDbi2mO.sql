-- job_id: job_R8cyeWJI6v_pNEZwUbkzRFDbi2mO
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:17.749000+00:00
-- started: 2026-08-01T05:46:17.893000+00:00
-- ended: 2026-08-01T05:46:18.686000+00:00

INSERT INTO `Linkedin_Campaigns` (`Id`, `AccountId`, `Locale_Country`, `CostType`, `Name`, `Type`) (SELECT main_table_alias.`Id`,main_table_alias.`AccountId`,main_table_alias.`Locale_Country`,main_table_alias.`CostType`,main_table_alias.`Name`,main_table_alias.`Type`  FROM `Linkedin_Campaigns_503adcfd_a80f_4934_94a1_ac93a70a968d` AS main_table_alias LEFT JOIN `Linkedin_Campaigns` ON main_table_alias.`Id` = `Linkedin_Campaigns`.`Id` WHERE `Linkedin_Campaigns`.`Id` IS NULL)
