-- job_id: d74c69e9-332d-43d7-a3bb-13f0620112f4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:10.950000+00:00
-- started: 2026-07-28T10:05:11.042000+00:00
-- ended: 2026-07-28T10:05:11.137000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'RT2995ST' ORDER BY bc_level
