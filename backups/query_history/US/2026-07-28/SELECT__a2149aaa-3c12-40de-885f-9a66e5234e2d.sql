-- job_id: a2149aaa-3c12-40de-885f-9a66e5234e2d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:49.416000+00:00
-- started: 2026-07-28T14:34:49.483000+00:00
-- ended: 2026-07-28T14:34:49.591000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB3983YT' ORDER BY bc_level
