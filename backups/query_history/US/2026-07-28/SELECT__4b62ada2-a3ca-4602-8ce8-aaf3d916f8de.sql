-- job_id: 4b62ada2-a3ca-4602-8ce8-aaf3d916f8de
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:17.803000+00:00
-- started: 2026-07-28T14:30:17.888000+00:00
-- ended: 2026-07-28T14:30:17.997000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD2000AD' ORDER BY bc_level
