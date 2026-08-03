-- job_id: 9444232a-2296-4223-8678-e36cd78ef5cf
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:26.829000+00:00
-- started: 2026-07-28T10:05:26.896000+00:00
-- ended: 2026-07-28T10:05:26.986000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT3983YT-JP' ORDER BY bc_level
