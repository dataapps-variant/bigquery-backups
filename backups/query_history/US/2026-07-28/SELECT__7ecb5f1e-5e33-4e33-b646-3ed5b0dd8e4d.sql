-- job_id: 7ecb5f1e-5e33-4e33-b646-3ed5b0dd8e4d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:10:41.130000+00:00
-- started: 2026-07-28T13:10:41.223000+00:00
-- ended: 2026-07-28T13:10:41.434000+00:00


    SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
    WHERE Entity = 'PD' AND Plan_Name = 'PD4988MT'
    ORDER BY day_order
