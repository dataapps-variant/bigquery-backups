-- job_id: 1565fe73-723e-4d7b-bbbe-61ca72fc2b1b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:54.646000+00:00
-- started: 2026-07-28T10:01:54.719000+00:00
-- ended: 2026-07-28T10:01:54.912000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'FS' AND Plan_Name = 'FS2788NT'
                ORDER BY day_order
