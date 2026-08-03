-- job_id: job_gStB59-wr3gs0jhD0ad_WZhmvp6r
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:18.586000+00:00
-- started: 2026-07-31T05:46:18.765000+00:00
-- ended: 2026-07-31T05:46:19.587000+00:00

INSERT INTO `Linkedin_Campaigns` (`Id`, `AccountId`, `Locale_Country`, `CostType`, `Name`, `Type`) (SELECT main_table_alias.`Id`,main_table_alias.`AccountId`,main_table_alias.`Locale_Country`,main_table_alias.`CostType`,main_table_alias.`Name`,main_table_alias.`Type`  FROM `Linkedin_Campaigns_fa82be03_7a1c_4982_803a_6b2737900a01` AS main_table_alias LEFT JOIN `Linkedin_Campaigns` ON main_table_alias.`Id` = `Linkedin_Campaigns`.`Id` WHERE `Linkedin_Campaigns`.`Id` IS NULL)
