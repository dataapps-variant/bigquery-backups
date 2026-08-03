-- job_id: 139fc1e4-3620-48c0-8fa2-3e6ce9a180e5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:49.845000+00:00
-- started: 2026-07-28T13:38:49.921000+00:00
-- ended: 2026-07-28T13:38:50.217000+00:00


                    SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                    WHERE Entity = 'FS' AND Plan_Name = 'FS2788NT'
                    ORDER BY day_order
