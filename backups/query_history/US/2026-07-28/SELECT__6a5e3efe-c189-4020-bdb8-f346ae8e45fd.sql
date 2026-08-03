-- job_id: 6a5e3efe-c189-4020-bdb8-f346ae8e45fd
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:35.918000+00:00
-- started: 2026-07-28T10:03:35.972000+00:00
-- ended: 2026-07-28T10:03:36.130000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT4780YT-JP' ORDER BY bc_level
