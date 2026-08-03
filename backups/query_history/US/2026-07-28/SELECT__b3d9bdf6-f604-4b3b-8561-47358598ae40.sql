-- job_id: b3d9bdf6-f604-4b3b-8561-47358598ae40
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:18.290000+00:00
-- started: 2026-07-28T10:06:18.357000+00:00
-- ended: 2026-07-28T10:06:18.450000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT4780YT-Non-JP' ORDER BY bc_level
