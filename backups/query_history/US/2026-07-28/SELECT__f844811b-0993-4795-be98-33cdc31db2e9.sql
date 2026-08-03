-- job_id: f844811b-0993-4795-be98-33cdc31db2e9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:38.127000+00:00
-- started: 2026-07-28T14:33:38.207000+00:00
-- ended: 2026-07-28T14:33:38.304000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT4780YT-JP' ORDER BY bc_level
