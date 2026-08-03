-- job_id: 63a80fb8-548c-4582-840e-278d202b3bee
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:49.746000+00:00
-- started: 2026-07-28T10:03:49.826000+00:00
-- ended: 2026-07-28T10:03:49.984000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'CT-Non-JP' AND Plan_Name = 'CT2788YT'
                ORDER BY day_order
