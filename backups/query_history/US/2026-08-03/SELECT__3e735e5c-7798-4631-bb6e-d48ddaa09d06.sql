-- job_id: 3e735e5c-7798-4631-bb6e-d48ddaa09d06
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:25:03.401000+00:00
-- started: 2026-08-03T12:25:03.456000+00:00
-- ended: 2026-08-03T12:25:03.541000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
