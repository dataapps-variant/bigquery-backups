-- job_id: fe223084-a500-4718-9d91-43c60e52982a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:21.191000+00:00
-- started: 2026-07-28T10:06:21.238000+00:00
-- ended: 2026-07-28T10:06:21.346000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3784YT-Non-JP' ORDER BY bc_level
