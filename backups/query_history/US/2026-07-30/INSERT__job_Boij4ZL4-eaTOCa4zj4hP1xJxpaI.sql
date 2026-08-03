-- job_id: job_Boij4ZL4-eaTOCa4zj4hP1xJxpaI
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: INSERT
-- created: 2026-07-30T05:46:18.831000+00:00
-- started: 2026-07-30T05:46:19.031000+00:00
-- ended: 2026-07-30T05:46:19.855000+00:00

INSERT INTO `Linkedin_AdsDailyReport` (`Date`, `AdId`, `CostInUsd`, `LandingPageClicks`) (SELECT main_table_alias.`Date`,main_table_alias.`AdId`,main_table_alias.`CostInUsd`,main_table_alias.`LandingPageClicks`  FROM `Linkedin_AdsDailyReport_cd7a5cd5_431d_48e2_9294_20b09fe1dc0f` AS main_table_alias)
