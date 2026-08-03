-- job_id: 7dc10f67-b673-4660-a6a3-bd02e3a1d587
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:23.771000+00:00
-- started: 2026-07-28T10:04:23.837000+00:00
-- ended: 2026-07-28T10:04:23.939000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'FS' AND Plan_Name = 'FS2788NT'
                ORDER BY day_order
