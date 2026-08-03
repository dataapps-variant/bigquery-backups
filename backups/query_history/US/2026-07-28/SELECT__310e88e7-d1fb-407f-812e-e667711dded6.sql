-- job_id: 310e88e7-d1fb-407f-812e-e667711dded6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:36:39.167000+00:00
-- started: 2026-07-28T13:36:39.284000+00:00
-- ended: 2026-07-28T13:36:39.481000+00:00


                    SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                    WHERE Entity = 'PD' AND Plan_Name = 'PD4988MT'
                    ORDER BY day_order
