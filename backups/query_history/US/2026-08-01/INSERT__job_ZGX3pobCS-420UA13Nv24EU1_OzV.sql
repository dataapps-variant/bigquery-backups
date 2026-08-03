-- job_id: job_ZGX3pobCS-420UA13Nv24EU1_OzV
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-01T05:46:16.293000+00:00
-- started: 2026-08-01T05:46:16.470000+00:00
-- ended: 2026-08-01T05:46:17.231000+00:00

INSERT INTO `Linkedin_AdsDailyReport` (`Date`, `AdId`, `CostInUsd`, `LandingPageClicks`) (SELECT main_table_alias.`Date`,main_table_alias.`AdId`,main_table_alias.`CostInUsd`,main_table_alias.`LandingPageClicks`  FROM `Linkedin_AdsDailyReport_85f205c3_b7d6_443d_a1b8_ab3822048ec5` AS main_table_alias)
