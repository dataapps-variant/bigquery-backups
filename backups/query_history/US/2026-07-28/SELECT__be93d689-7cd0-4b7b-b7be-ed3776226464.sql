-- job_id: be93d689-7cd0-4b7b-b7be-ed3776226464
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:04:58.513000+00:00
-- started: 2026-07-28T10:04:58.591000+00:00
-- ended: 2026-07-28T10:04:58.780000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF8970ST' ORDER BY bc_level
