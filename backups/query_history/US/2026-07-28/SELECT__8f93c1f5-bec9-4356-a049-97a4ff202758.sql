-- job_id: 8f93c1f5-bec9-4356-a049-97a4ff202758
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:13.885000+00:00
-- started: 2026-07-28T14:30:13.983000+00:00
-- ended: 2026-07-28T14:30:14.110000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'PD' AND Plan_Name = 'PD1440AD'
                ORDER BY day_order
