-- job_id: 1389adfe-c722-4311-8b9c-85780d039486
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:07.801000+00:00
-- started: 2026-07-28T10:04:07.883000+00:00
-- ended: 2026-07-28T10:04:07.974000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL2788ST' ORDER BY bc_level
