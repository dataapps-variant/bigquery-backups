-- job_id: job_KQ2c4YB8fEgqmuP1FHB45NeJHFmT
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-31T05:46:18.708000+00:00
-- started: 2026-07-31T05:46:18.903000+00:00
-- ended: 2026-07-31T05:46:22.587000+00:00

INSERT INTO `Linkedin_AdsDailyReport` (`Date`, `AdId`, `CostInUsd`, `LandingPageClicks`) (SELECT main_table_alias.`Date`,main_table_alias.`AdId`,main_table_alias.`CostInUsd`,main_table_alias.`LandingPageClicks`  FROM `Linkedin_AdsDailyReport_0f9bba8a_adb9_4c59_82f2_b802b59df061` AS main_table_alias)
