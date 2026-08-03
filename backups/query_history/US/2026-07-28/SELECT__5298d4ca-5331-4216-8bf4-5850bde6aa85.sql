-- job_id: 5298d4ca-5331-4216-8bf4-5850bde6aa85
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:20.369000+00:00
-- started: 2026-07-28T10:05:20.463000+00:00
-- ended: 2026-07-28T10:05:20.615000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF2788ST' ORDER BY bc_level
