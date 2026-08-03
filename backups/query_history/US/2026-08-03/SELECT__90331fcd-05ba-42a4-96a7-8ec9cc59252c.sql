-- job_id: 90331fcd-05ba-42a4-96a7-8ec9cc59252c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:09.904000+00:00
-- started: 2026-08-03T12:26:09.955000+00:00
-- ended: 2026-08-03T12:26:10.178000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT1792YT-JP' ORDER BY bc_level
