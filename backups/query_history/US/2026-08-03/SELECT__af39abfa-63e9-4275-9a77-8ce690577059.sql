-- job_id: af39abfa-63e9-4275-9a77-8ce690577059
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:44.490000+00:00
-- started: 2026-08-03T12:22:44.552000+00:00
-- ended: 2026-08-03T12:22:44.744000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT2788YT' ORDER BY bc_level
