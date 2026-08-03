-- job_id: dc38edfc-39c6-4a9c-ade9-3eea5e99e02a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:33.431000+00:00
-- started: 2026-07-28T14:34:33.506000+00:00
-- ended: 2026-07-28T14:34:33.657000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3784YT-Non-JP' ORDER BY bc_level
