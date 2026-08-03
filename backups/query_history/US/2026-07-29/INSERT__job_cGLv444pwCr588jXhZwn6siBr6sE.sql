-- job_id: job_cGLv444pwCr588jXhZwn6siBr6sE
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-29T05:46:18.360000+00:00
-- started: 2026-07-29T05:46:18.534000+00:00
-- ended: 2026-07-29T05:46:19.494000+00:00

INSERT INTO `Linkedin_AdsDailyReport` (`Date`, `AdId`, `CostInUsd`, `LandingPageClicks`) (SELECT main_table_alias.`Date`,main_table_alias.`AdId`,main_table_alias.`CostInUsd`,main_table_alias.`LandingPageClicks`  FROM `Linkedin_AdsDailyReport_185f3c72_79e0_4738_b59d_2e5abc6e2457` AS main_table_alias)
