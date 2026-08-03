-- job_id: cb3bcaa2-dbb7-4574-97d9-b5dc04e04a2b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:14.817000+00:00
-- started: 2026-07-28T14:33:14.892000+00:00
-- ended: 2026-07-28T14:33:15.009000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'CT-JP' AND Plan_Name = 'CT2788YT'
                ORDER BY day_order
