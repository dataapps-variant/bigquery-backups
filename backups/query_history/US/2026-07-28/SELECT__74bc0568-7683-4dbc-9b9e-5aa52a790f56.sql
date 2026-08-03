-- job_id: 74bc0568-7683-4dbc-9b9e-5aa52a790f56
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T09:59:33.540000+00:00
-- started: 2026-07-28T09:59:33.640000+00:00
-- ended: 2026-07-28T09:59:33.851000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'PD' AND Plan_Name = 'PD4988MT'
                ORDER BY day_order
