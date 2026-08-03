-- job_id: 6ab22924-f05e-4fdb-b92c-ebf42f52dece
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:09.588000+00:00
-- started: 2026-07-28T10:00:09.666000+00:00
-- ended: 2026-07-28T10:00:09.872000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'PD' AND Plan_Name = 'PD1440AD'
                ORDER BY day_order
