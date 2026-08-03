-- job_id: 4774b726-7d24-48a3-b066-9f0dd85ee5ed
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:23:54.486000+00:00
-- started: 2026-08-03T12:23:54.564000+00:00
-- ended: 2026-08-03T12:23:54.769000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL1194ST' ORDER BY bc_level
