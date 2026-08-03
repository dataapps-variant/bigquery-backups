-- job_id: 6b107ca0-7e03-4853-9840-bfbee44d44f6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:01.085000+00:00
-- started: 2026-07-28T10:00:01.182000+00:00
-- ended: 2026-07-28T10:00:01.345000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD2995MT' ORDER BY bc_level
