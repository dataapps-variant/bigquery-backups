-- job_id: 899fddcc-5c73-4fb6-90a5-344166eb438f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:12.476000+00:00
-- started: 2026-07-28T14:30:12.573000+00:00
-- ended: 2026-07-28T14:30:12.694000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD1440AD' ORDER BY bc_level
