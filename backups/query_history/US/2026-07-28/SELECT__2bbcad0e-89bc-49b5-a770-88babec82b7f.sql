-- job_id: 2bbcad0e-89bc-49b5-a770-88babec82b7f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:53.025000+00:00
-- started: 2026-07-28T14:30:53.106000+00:00
-- ended: 2026-07-28T14:30:53.209000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'AT3995YT' ORDER BY bc_level
