-- job_id: 318dbbf3-2ba4-423e-a4da-da5b82f9dd7f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:22:23.819000+00:00
-- started: 2026-08-03T12:22:23.913000+00:00
-- ended: 2026-08-03T12:22:24.036000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD1000AE' ORDER BY bc_level
