-- job_id: 9b19a486-0b22-4f20-91f0-eac7c57fb2bd
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:44.185000+00:00
-- started: 2026-07-28T10:03:44.263000+00:00
-- ended: 2026-07-28T10:03:44.419000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT6373YT-JP' ORDER BY bc_level
