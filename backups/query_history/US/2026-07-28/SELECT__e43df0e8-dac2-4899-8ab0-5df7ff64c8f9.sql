-- job_id: e43df0e8-dac2-4899-8ab0-5df7ff64c8f9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:34.813000+00:00
-- started: 2026-07-28T10:04:34.955000+00:00
-- ended: 2026-07-28T10:04:35.158000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3784YT-Non-JP' ORDER BY bc_level
