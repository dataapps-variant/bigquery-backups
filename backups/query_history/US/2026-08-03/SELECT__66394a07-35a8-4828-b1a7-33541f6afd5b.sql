-- job_id: 66394a07-35a8-4828-b1a7-33541f6afd5b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:25.748000+00:00
-- started: 2026-08-03T12:24:25.870000+00:00
-- ended: 2026-08-03T12:24:26.046000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
