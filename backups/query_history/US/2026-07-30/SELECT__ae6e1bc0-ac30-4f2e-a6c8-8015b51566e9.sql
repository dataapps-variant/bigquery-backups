-- job_id: ae6e1bc0-ac30-4f2e-a6c8-8015b51566e9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:11:28.961000+00:00
-- started: 2026-07-30T16:11:29.051000+00:00
-- ended: 2026-07-30T16:11:29.279000+00:00


    SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
    WHERE Entity = 'FS' AND Plan_Name = 'FS2788NT'
    ORDER BY day_order
