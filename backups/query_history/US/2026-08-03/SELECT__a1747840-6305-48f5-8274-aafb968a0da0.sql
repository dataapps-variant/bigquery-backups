-- job_id: a1747840-6305-48f5-8274-aafb968a0da0
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:21:57.698000+00:00
-- started: 2026-08-03T12:21:57.800000+00:00
-- ended: 2026-08-03T12:21:58.151000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'PD' AND Plan_Name = 'PD4988MT'
                ORDER BY day_order
