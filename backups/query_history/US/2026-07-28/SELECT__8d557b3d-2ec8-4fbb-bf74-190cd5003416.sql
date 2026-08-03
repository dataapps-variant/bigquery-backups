-- job_id: 8d557b3d-2ec8-4fbb-bf74-190cd5003416
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:36.127000+00:00
-- started: 2026-07-28T10:02:36.199000+00:00
-- ended: 2026-07-28T10:02:36.304000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'PD1000AE' ORDER BY bc_level
