-- job_id: 1d94cf51-2ed0-459c-994a-af4a663863ec
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:10:43.484000+00:00
-- started: 2026-07-28T13:10:43.571000+00:00
-- ended: 2026-07-28T13:10:43.784000+00:00


    SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
    WHERE Entity = 'CT-JP' AND Plan_Name = 'CT2788YT'
    ORDER BY day_order
