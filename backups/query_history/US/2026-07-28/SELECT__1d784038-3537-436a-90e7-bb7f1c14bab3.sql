-- job_id: 1d784038-3537-436a-90e7-bb7f1c14bab3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:26.876000+00:00
-- started: 2026-07-28T14:32:26.961000+00:00
-- ended: 2026-07-28T14:32:27.048000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
