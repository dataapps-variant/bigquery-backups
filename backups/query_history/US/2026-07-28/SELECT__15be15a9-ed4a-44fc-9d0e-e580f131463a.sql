-- job_id: 15be15a9-ed4a-44fc-9d0e-e580f131463a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:46.083000+00:00
-- started: 2026-07-28T10:05:46.137000+00:00
-- ended: 2026-07-28T10:05:46.235000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'CT-Non-JP' AND Plan_Name = 'CT2788YT'
                ORDER BY day_order
