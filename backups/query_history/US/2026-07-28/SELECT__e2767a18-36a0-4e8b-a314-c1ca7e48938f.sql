-- job_id: e2767a18-36a0-4e8b-a314-c1ca7e48938f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:13.971000+00:00
-- started: 2026-07-28T10:00:14.115000+00:00
-- ended: 2026-07-28T10:00:14.294000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD2000AD' ORDER BY bc_level
