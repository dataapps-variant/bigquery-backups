-- job_id: 89ebc901-7600-49ab-b81a-8a075a2a1a22
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:39.297000+00:00
-- started: 2026-07-28T10:06:39.363000+00:00
-- ended: 2026-07-28T10:06:39.458000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF4995ST' ORDER BY bc_level
