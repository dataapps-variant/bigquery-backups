-- job_id: dbdb410b-ebd9-4250-b0fe-20ae36046cfe
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:06.432000+00:00
-- started: 2026-07-28T13:41:06.493000+00:00
-- ended: 2026-07-28T13:41:06.671000+00:00


                    SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                    WHERE Entity = 'CT-Non-JP' AND Plan_Name = 'CT2788YT'
                    ORDER BY day_order
