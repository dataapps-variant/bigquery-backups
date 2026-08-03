-- job_id: 51e59453-032e-4543-acf0-e1f64469bed2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:32.207000+00:00
-- started: 2026-07-28T10:04:32.274000+00:00
-- ended: 2026-07-28T10:04:32.353000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
