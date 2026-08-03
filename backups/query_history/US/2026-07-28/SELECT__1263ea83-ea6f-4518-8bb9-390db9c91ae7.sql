-- job_id: 1263ea83-ea6f-4518-8bb9-390db9c91ae7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:10:42.507000+00:00
-- started: 2026-07-28T13:10:42.883000+00:00
-- ended: 2026-07-28T13:10:43.077000+00:00


    SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
    WHERE Entity = 'FS' AND Plan_Name = 'FS2788NT'
    ORDER BY day_order
