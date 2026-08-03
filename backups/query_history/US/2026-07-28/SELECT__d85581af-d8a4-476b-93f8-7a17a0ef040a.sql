-- job_id: d85581af-d8a4-476b-93f8-7a17a0ef040a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:02:58.076000+00:00
-- started: 2026-07-28T10:02:58.146000+00:00
-- ended: 2026-07-28T10:02:58.325000+00:00


            SELECT bc_level, retention_pct FROM `variant-finance-data-project.R100.R100_Retention_Curves`
            WHERE Curve_Name = 'RT2788ST' ORDER BY bc_level
