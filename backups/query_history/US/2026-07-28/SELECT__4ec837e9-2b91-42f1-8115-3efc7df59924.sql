-- job_id: 4ec837e9-2b91-42f1-8115-3efc7df59924
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:57.502000+00:00
-- started: 2026-07-28T14:31:57.586000+00:00
-- ended: 2026-07-28T14:31:57.745000+00:00


                SELECT day_of_week, weight_pct FROM `variant-finance-data-project.R100.R100_Spend_Curve`
                WHERE Entity = 'FS' AND Plan_Name = 'FS2788NT'
                ORDER BY day_order
