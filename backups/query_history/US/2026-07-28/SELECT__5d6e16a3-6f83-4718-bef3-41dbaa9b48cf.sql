-- job_id: 5d6e16a3-6f83-4718-bef3-41dbaa9b48cf
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:42.066000+00:00
-- started: 2026-07-28T10:06:42.129000+00:00
-- ended: 2026-07-28T10:06:42.219000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF2995ST' ORDER BY bc_level
