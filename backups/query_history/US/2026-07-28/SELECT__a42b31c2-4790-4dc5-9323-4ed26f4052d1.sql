-- job_id: a42b31c2-4790-4dc5-9323-4ed26f4052d1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:35:02.024000+00:00
-- started: 2026-07-28T14:35:02.143000+00:00
-- ended: 2026-07-28T14:35:02.245000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF4995ST' ORDER BY bc_level
