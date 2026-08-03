-- job_id: 9ce84f3e-43a6-4e25-9b50-b1491cfe7641
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:14.299000+00:00
-- started: 2026-07-28T13:37:14.405000+00:00
-- ended: 2026-07-28T13:37:14.929000+00:00


                    SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                    WHERE Entity = 'PD' AND Plan_Name = 'PD1440AD'
                    ORDER BY day_order
