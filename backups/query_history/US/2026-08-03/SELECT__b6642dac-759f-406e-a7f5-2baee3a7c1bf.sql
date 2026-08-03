-- job_id: b6642dac-759f-406e-a7f5-2baee3a7c1bf
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:23.077000+00:00
-- started: 2026-08-03T12:26:23.135000+00:00
-- ended: 2026-08-03T12:26:23.292000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT6373YT-JP' ORDER BY bc_level
