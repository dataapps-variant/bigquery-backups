-- job_id: 2abde2da-edab-445b-81e3-69ccc3e1726a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:29:32.880000+00:00
-- started: 2026-07-28T14:29:32.975000+00:00
-- ended: 2026-07-28T14:29:33.085000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD4988MT' ORDER BY bc_level
