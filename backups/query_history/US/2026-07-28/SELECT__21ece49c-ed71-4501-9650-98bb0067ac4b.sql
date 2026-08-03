-- job_id: 21ece49c-ed71-4501-9650-98bb0067ac4b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:46.500000+00:00
-- started: 2026-07-28T14:32:46.602000+00:00
-- ended: 2026-07-28T14:32:46.720000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CV2688ST' ORDER BY bc_level
