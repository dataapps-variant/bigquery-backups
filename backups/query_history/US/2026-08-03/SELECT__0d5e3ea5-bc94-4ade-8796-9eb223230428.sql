-- job_id: 0d5e3ea5-bc94-4ade-8796-9eb223230428
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:12.492000+00:00
-- started: 2026-08-03T12:22:12.586000+00:00
-- ended: 2026-08-03T12:22:12.858000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD2595ST' ORDER BY bc_level
