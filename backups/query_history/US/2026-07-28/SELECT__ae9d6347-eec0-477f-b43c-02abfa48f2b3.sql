-- job_id: ae9d6347-eec0-477f-b43c-02abfa48f2b3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:01:53.529000+00:00
-- started: 2026-07-28T10:01:53.607000+00:00
-- ended: 2026-07-28T10:01:53.777000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
