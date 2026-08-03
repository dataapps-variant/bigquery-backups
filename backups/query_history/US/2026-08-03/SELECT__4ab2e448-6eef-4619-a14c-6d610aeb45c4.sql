-- job_id: 4ab2e448-6eef-4619-a14c-6d610aeb45c4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:18.818000+00:00
-- started: 2026-08-03T12:26:18.909000+00:00
-- ended: 2026-08-03T12:26:19.103000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3784YT-JP' ORDER BY bc_level
