-- job_id: ee794888-3fae-4206-a7b2-f3da749b4d84
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:51.136000+00:00
-- started: 2026-07-28T14:32:51.208000+00:00
-- ended: 2026-07-28T14:32:51.284000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV2788ST' ORDER BY bc_level
