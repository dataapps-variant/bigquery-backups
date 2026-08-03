-- job_id: 46e2b1e4-5113-4589-863c-4376807a5ae7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:52.691000+00:00
-- started: 2026-08-03T12:27:52.750000+00:00
-- ended: 2026-08-03T12:27:52.841000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF2995ST' ORDER BY bc_level
