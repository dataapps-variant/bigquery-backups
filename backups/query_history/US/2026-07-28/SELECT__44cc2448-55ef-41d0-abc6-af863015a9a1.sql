-- job_id: 44cc2448-55ef-41d0-abc6-af863015a9a1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:07.633000+00:00
-- started: 2026-07-28T10:05:07.682000+00:00
-- ended: 2026-07-28T10:05:07.771000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF2995ST' ORDER BY bc_level
