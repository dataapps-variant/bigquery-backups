-- job_id: 9bcf0978-49e3-4129-a54b-cf1621ca7abd
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:32.980000+00:00
-- started: 2026-07-28T10:05:33.054000+00:00
-- ended: 2026-07-28T10:05:33.157000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT1792YT-JP' ORDER BY bc_level
