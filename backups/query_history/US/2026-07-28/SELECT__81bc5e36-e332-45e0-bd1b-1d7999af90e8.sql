-- job_id: 81bc5e36-e332-45e0-bd1b-1d7999af90e8
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:04.821000+00:00
-- started: 2026-07-28T10:02:04.935000+00:00
-- ended: 2026-07-28T10:02:05.014000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
