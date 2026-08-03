-- job_id: job_gPVba9Fnd7Kbxm72UdG6TCn6_DXm
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:20.218000+00:00
-- started: 2026-07-30T05:46:20.371000+00:00
-- ended: 2026-07-30T05:46:24.257000+00:00

INSERT INTO `Linkedin_Campaigns` (`Id`, `AccountId`, `Locale_Country`, `CostType`, `Name`, `Type`) (SELECT main_table_alias.`Id`,main_table_alias.`AccountId`,main_table_alias.`Locale_Country`,main_table_alias.`CostType`,main_table_alias.`Name`,main_table_alias.`Type`  FROM `Linkedin_Campaigns_053e1046_c0dd_4736_9615_0d25904ce554` AS main_table_alias LEFT JOIN `Linkedin_Campaigns` ON main_table_alias.`Id` = `Linkedin_Campaigns`.`Id` WHERE `Linkedin_Campaigns`.`Id` IS NULL)
