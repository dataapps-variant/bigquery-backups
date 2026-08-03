-- job_id: e6f984a2-9590-4199-b99d-7a9ec2159ae1
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:11.087000+00:00
-- started: 2026-07-28T10:03:11.152000+00:00
-- ended: 2026-07-28T10:03:11.320000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'CT2788YT-JP' ORDER BY bc_level
