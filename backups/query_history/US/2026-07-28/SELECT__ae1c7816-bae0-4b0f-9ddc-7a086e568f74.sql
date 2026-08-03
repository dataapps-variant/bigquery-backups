-- job_id: ae1c7816-bae0-4b0f-9ddc-7a086e568f74
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:06.889000+00:00
-- started: 2026-07-28T14:32:06.975000+00:00
-- ended: 2026-07-28T14:32:07.074000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
