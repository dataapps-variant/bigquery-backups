-- job_id: eabded25-e0b7-488d-b05a-714ac43741ef
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:27.836000+00:00
-- started: 2026-07-28T10:03:27.889000+00:00
-- ended: 2026-07-28T10:03:28.074000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT5178YT-JP' ORDER BY bc_level
