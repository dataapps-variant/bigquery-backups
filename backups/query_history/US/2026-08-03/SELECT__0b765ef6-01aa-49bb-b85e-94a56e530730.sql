-- job_id: 0b765ef6-01aa-49bb-b85e-94a56e530730
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:42.887000+00:00
-- started: 2026-08-03T12:27:42.993000+00:00
-- ended: 2026-08-03T12:27:43.173000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF8970ST' ORDER BY bc_level
