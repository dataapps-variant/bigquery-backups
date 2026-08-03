-- job_id: job_L_aM1MOK5GMmmYBCCUhA-DgeOgCv
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-08-02T05:46:15.153000+00:00
-- started: 2026-08-02T05:46:15.308000+00:00
-- ended: 2026-08-02T05:46:16.096000+00:00

INSERT INTO `Linkedin_AdsDailyReport` (`Date`, `AdId`, `CostInUsd`, `LandingPageClicks`) (SELECT main_table_alias.`Date`,main_table_alias.`AdId`,main_table_alias.`CostInUsd`,main_table_alias.`LandingPageClicks`  FROM `Linkedin_AdsDailyReport_4bfda6e6_5132_4725_a3ae_b719290975cb` AS main_table_alias)
