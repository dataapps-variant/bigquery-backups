-- job_id: b4f6ec4e-5a92-4384-90e6-ab25c5e610e7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:27.360000+00:00
-- started: 2026-08-03T12:24:27.430000+00:00
-- ended: 2026-08-03T12:24:27.633000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'FS' AND Plan_Name = 'FS2788NT'
                ORDER BY day_order
