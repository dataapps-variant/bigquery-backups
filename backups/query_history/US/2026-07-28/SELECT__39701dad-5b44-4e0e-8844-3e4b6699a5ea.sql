-- job_id: 39701dad-5b44-4e0e-8844-3e4b6699a5ea
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:07.112000+00:00
-- started: 2026-07-28T10:01:07.209000+00:00
-- ended: 2026-07-28T10:01:07.904000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL2788ST' ORDER BY bc_level
