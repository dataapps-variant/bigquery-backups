-- job_id: bbcf8695-ff12-4e42-8714-564e0fc67983
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:23.092000+00:00
-- started: 2026-07-28T14:31:23.197000+00:00
-- ended: 2026-07-28T14:31:23.369000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL2995ST' ORDER BY bc_level
