-- job_id: ce6f1a7e-176c-4bdf-85ce-601a9ad06fc8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:11:29.700000+00:00
-- started: 2026-07-30T16:11:29.790000+00:00
-- ended: 2026-07-30T16:11:29.999000+00:00


    SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
    WHERE Entity = 'CT-JP' AND Plan_Name = 'CT2788YT'
    ORDER BY day_order
