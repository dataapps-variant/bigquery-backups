-- job_id: f985611a-4577-4f58-b608-c8f65bf50632
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:02.933000+00:00
-- started: 2026-07-28T10:03:02.989000+00:00
-- ended: 2026-07-28T10:03:03.159000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'RT2995ST' ORDER BY bc_level
