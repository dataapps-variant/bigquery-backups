-- job_id: 5127378d-62a4-4978-a803-460c815877aa
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:49.897000+00:00
-- started: 2026-07-28T10:04:49.973000+00:00
-- ended: 2026-07-28T10:04:50.056000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
