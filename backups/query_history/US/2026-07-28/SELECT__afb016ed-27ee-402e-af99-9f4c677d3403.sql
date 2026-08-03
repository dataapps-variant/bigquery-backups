-- job_id: afb016ed-27ee-402e-af99-9f4c677d3403
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:32.208000+00:00
-- started: 2026-07-28T10:03:32.282000+00:00
-- ended: 2026-07-28T10:03:32.429000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CN3400ST' ORDER BY bc_level
