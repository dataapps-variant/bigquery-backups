-- job_id: 04537af5-93d6-4478-ba8b-564fc9589861
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:35.825000+00:00
-- started: 2026-07-28T10:05:35.867000+00:00
-- ended: 2026-07-28T10:05:35.961000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT4780YT-JP' ORDER BY bc_level
