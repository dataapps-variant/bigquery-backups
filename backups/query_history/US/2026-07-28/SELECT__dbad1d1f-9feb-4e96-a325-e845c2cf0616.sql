-- job_id: dbad1d1f-9feb-4e96-a325-e845c2cf0616
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:28.564000+00:00
-- started: 2026-07-28T10:06:28.622000+00:00
-- ended: 2026-07-28T10:06:28.723000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'MB5178YT' ORDER BY bc_level
