-- job_id: 10a82dc8-7d96-47c5-ba50-31233409baae
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:48.644000+00:00
-- started: 2026-08-03T12:25:48.715000+00:00
-- ended: 2026-08-03T12:25:48.914000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'CT-JP' AND Plan_Name = 'CT2788YT'
                ORDER BY day_order
