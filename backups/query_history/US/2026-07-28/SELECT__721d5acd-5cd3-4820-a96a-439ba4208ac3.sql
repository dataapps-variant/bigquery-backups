-- job_id: 721d5acd-5cd3-4820-a96a-439ba4208ac3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:11.917000+00:00
-- started: 2026-07-28T14:32:12.008000+00:00
-- ended: 2026-07-28T14:32:12.132000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'FS2788NT' ORDER BY bc_level
