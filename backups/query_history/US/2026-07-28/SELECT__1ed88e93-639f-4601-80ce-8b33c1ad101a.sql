-- job_id: 1ed88e93-639f-4601-80ce-8b33c1ad101a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:05.162000+00:00
-- started: 2026-07-28T14:33:05.224000+00:00
-- ended: 2026-07-28T14:33:05.315000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'RT2995ST' ORDER BY bc_level
