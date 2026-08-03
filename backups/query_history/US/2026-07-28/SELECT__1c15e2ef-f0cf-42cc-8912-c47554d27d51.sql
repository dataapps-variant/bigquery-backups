-- job_id: 1c15e2ef-f0cf-42cc-8912-c47554d27d51
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:18.390000+00:00
-- started: 2026-07-28T14:34:18.457000+00:00
-- ended: 2026-07-28T14:34:18.571000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3588YT-Non-JP' ORDER BY bc_level
