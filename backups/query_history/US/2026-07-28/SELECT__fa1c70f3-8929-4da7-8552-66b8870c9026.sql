-- job_id: fa1c70f3-8929-4da7-8552-66b8870c9026
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:12.543000+00:00
-- started: 2026-07-28T10:02:12.630000+00:00
-- ended: 2026-07-28T10:02:12.745000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'PD' AND Plan_Name = 'PD4988MT'
                ORDER BY day_order
