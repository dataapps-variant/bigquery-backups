-- job_id: 9ef42c16-6232-4e7d-87e7-66ed17e4d354
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:51.093000+00:00
-- started: 2026-07-28T14:33:51.192000+00:00
-- ended: 2026-07-28T14:33:51.275000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'CT-Non-JP' AND Plan_Name = 'CT2788YT'
                ORDER BY day_order
