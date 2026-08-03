-- job_id: job_UWjiqa82b_MPtLL7CbLfEvezXt2N
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T14:29:33.621000+00:00
-- started: 2026-07-28T14:29:33.742000+00:00
-- ended: 2026-07-28T14:29:33.774000+00:00

SELECT * FROM `variant-finance-data-project.ICARUS_Multi.7K_30D_Main_Table` 
Where Reporting_Date >= "2026-07-12"
and App_Name = "CT-JP"
