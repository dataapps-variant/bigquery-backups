-- job_id: 6f4844fb-d678-4c2b-855f-7473a4279709
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:01.674000+00:00
-- started: 2026-07-28T14:31:01.764000+00:00
-- ended: 2026-07-28T14:31:01.908000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CN3400ST' ORDER BY bc_level
