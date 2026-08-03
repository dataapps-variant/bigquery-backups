-- job_id: 6464f24b-1848-4e0d-aaff-a4615c9a05c3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:49.295000+00:00
-- started: 2026-07-28T10:06:49.348000+00:00
-- ended: 2026-07-28T10:06:49.436000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'JF5985ST' ORDER BY bc_level
