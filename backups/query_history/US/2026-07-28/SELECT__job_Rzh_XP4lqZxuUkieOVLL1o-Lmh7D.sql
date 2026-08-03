-- job_id: job_Rzh_XP4lqZxuUkieOVLL1o-Lmh7D
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T14:29:39.824000+00:00
-- started: 2026-07-28T14:29:40.019000+00:00
-- ended: 2026-07-28T14:29:40.694000+00:00

SELECT * FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table` 
Where Report_Date >= "2026-07-12"
and App_Name = "CT-JP"
