-- job_id: e7754356-b203-432b-b989-96f27db8b04e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:42.610000+00:00
-- started: 2026-07-28T10:01:42.710000+00:00
-- ended: 2026-07-28T10:01:42.904000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'EN2788YT' ORDER BY bc_level
