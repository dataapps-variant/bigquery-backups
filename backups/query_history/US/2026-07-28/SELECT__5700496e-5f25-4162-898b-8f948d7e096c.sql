-- job_id: 5700496e-5f25-4162-898b-8f948d7e096c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:31.760000+00:00
-- started: 2026-07-28T10:01:31.820000+00:00
-- ended: 2026-07-28T10:01:32.006000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL5985ST' ORDER BY bc_level
