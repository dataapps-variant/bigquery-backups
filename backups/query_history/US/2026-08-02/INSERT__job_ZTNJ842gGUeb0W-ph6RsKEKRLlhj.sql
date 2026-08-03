-- job_id: job_ZTNJ842gGUeb0W-ph6RsKEKRLlhj
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:46:16.407000+00:00
-- started: 2026-08-02T05:46:16.565000+00:00
-- ended: 2026-08-02T05:46:17.383000+00:00

INSERT INTO `Linkedin_Campaigns` (`Id`, `AccountId`, `Locale_Country`, `CostType`, `Name`, `Type`) (SELECT main_table_alias.`Id`,main_table_alias.`AccountId`,main_table_alias.`Locale_Country`,main_table_alias.`CostType`,main_table_alias.`Name`,main_table_alias.`Type`  FROM `Linkedin_Campaigns_e6698d7d_c106_477f_baba_72d4187d8771` AS main_table_alias LEFT JOIN `Linkedin_Campaigns` ON main_table_alias.`Id` = `Linkedin_Campaigns`.`Id` WHERE `Linkedin_Campaigns`.`Id` IS NULL)
