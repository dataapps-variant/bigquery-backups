-- job_id: bdf94339-7740-43c6-a04b-eb4ffb404b45
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:37.214000+00:00
-- started: 2026-07-28T10:03:37.325000+00:00
-- ended: 2026-07-28T10:03:37.473000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CN3999ST' ORDER BY bc_level
