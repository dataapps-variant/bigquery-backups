-- job_id: 0543244c-1607-4623-9b93-8a5769952630
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:35:06.573000+00:00
-- started: 2026-07-28T14:35:06.673000+00:00
-- ended: 2026-07-28T14:35:06.762000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF2995ST' ORDER BY bc_level
