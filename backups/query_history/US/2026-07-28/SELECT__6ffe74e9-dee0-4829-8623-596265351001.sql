-- job_id: 6ffe74e9-dee0-4829-8623-596265351001
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:29:34.476000+00:00
-- started: 2026-07-28T14:29:34.632000+00:00
-- ended: 2026-07-28T14:29:34.755000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'PD' AND Plan_Name = 'PD4988MT'
                ORDER BY day_order
