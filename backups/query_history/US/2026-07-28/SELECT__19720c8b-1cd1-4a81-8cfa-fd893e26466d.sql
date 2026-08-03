-- job_id: 19720c8b-1cd1-4a81-8cfa-fd893e26466d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:31.798000+00:00
-- started: 2026-07-28T10:02:31.900000+00:00
-- ended: 2026-07-28T10:02:32.079000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD1000AE' ORDER BY bc_level
