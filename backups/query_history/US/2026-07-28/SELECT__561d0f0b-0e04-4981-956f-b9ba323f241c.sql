-- job_id: 561d0f0b-0e04-4981-956f-b9ba323f241c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:28.046000+00:00
-- started: 2026-07-28T10:01:28.125000+00:00
-- ended: 2026-07-28T10:01:28.283000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CL8970ST' ORDER BY bc_level
