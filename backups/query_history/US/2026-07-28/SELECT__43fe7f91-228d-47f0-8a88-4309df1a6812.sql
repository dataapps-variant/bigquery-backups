-- job_id: 43fe7f91-228d-47f0-8a88-4309df1a6812
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:17+00:00
-- started: 2026-07-28T10:05:17.061000+00:00
-- ended: 2026-07-28T10:05:17.142000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'CT-JP' AND Plan_Name = 'CT2788YT'
                ORDER BY day_order
