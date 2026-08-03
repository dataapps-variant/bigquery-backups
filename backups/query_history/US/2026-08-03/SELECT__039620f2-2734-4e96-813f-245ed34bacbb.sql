-- job_id: 039620f2-2734-4e96-813f-245ed34bacbb
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:37.181000+00:00
-- started: 2026-08-03T12:27:37.244000+00:00
-- ended: 2026-08-03T12:27:37.423000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF2995ST' ORDER BY bc_level
