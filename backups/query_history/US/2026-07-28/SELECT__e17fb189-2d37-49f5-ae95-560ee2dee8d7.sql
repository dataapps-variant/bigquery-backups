-- job_id: e17fb189-2d37-49f5-ae95-560ee2dee8d7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:14.325000+00:00
-- started: 2026-07-28T14:34:14.393000+00:00
-- ended: 2026-07-28T14:34:14.503000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT1792YT-Non-JP' ORDER BY bc_level
