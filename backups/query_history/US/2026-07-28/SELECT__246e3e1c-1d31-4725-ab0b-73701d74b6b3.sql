-- job_id: 246e3e1c-1d31-4725-ab0b-73701d74b6b3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:36.464000+00:00
-- started: 2026-07-28T14:31:36.546000+00:00
-- ended: 2026-07-28T14:31:36.654000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL5985ST' ORDER BY bc_level
