-- job_id: 3f64686b-7e26-469f-b7ec-67eeb0837f95
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:21:52.934000+00:00
-- started: 2026-08-03T12:21:53.267000+00:00
-- ended: 2026-08-03T12:21:55.481000+00:00


    SELECT COUNT(*) AS n, COUNT(DISTINCT Input_ID) AS inputs
    FROM `variant-finance-data-project.R100.R100_Historical_Main`
