-- job_id: job_4K9hpSKtDmmiuLgDxTicnxsR417i
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-03T05:46:14.391000+00:00
-- started: 2026-08-03T05:46:14.566000+00:00
-- ended: 2026-08-03T05:46:15.312000+00:00

INSERT INTO `Linkedin_AdsDailyReport` (`Date`, `AdId`, `CostInUsd`, `LandingPageClicks`) (SELECT main_table_alias.`Date`,main_table_alias.`AdId`,main_table_alias.`CostInUsd`,main_table_alias.`LandingPageClicks`  FROM `Linkedin_AdsDailyReport_6e3d43c5_308f_4ae2_a418_c193dc5f941b` AS main_table_alias)
