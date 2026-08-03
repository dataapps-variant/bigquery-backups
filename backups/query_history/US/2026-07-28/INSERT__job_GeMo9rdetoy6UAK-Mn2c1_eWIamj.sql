-- job_id: job_GeMo9rdetoy6UAK-Mn2c1_eWIamj
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-28T05:46:24.245000+00:00
-- started: 2026-07-28T05:46:24.412000+00:00
-- ended: 2026-07-28T05:46:25.306000+00:00

INSERT INTO `Linkedin_AdsDailyReport` (`Date`, `AdId`, `CostInUsd`, `LandingPageClicks`) (SELECT main_table_alias.`Date`,main_table_alias.`AdId`,main_table_alias.`CostInUsd`,main_table_alias.`LandingPageClicks`  FROM `Linkedin_AdsDailyReport_b7e6e08e_6a90_4ae7_b96e_df4c8b4bcbe7` AS main_table_alias)
