-- job_id: 5b0701f6-9b9c-4b28-a5d0-c3f76beec779
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:35.724000+00:00
-- started: 2026-08-03T12:22:35.785000+00:00
-- ended: 2026-08-03T12:22:35.988000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'PD' AND Plan_Name = 'PD1440AD'
                ORDER BY day_order
