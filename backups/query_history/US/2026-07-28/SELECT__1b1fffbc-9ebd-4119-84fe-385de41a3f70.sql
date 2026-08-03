-- job_id: 1b1fffbc-9ebd-4119-84fe-385de41a3f70
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:23.896000+00:00
-- started: 2026-07-28T10:03:23.946000+00:00
-- ended: 2026-07-28T10:03:24.073000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3983YT-JP' ORDER BY bc_level
