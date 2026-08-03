-- job_id: 609d2703-bd1b-460f-b7b7-7f5999e40c7b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:28.906000+00:00
-- started: 2026-08-03T12:26:28.971000+00:00
-- ended: 2026-08-03T12:26:29.225000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'CT-Non-JP' AND Plan_Name = 'CT2788YT'
                ORDER BY day_order
