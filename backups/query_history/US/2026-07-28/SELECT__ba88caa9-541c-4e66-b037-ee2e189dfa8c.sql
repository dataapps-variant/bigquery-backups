-- job_id: ba88caa9-541c-4e66-b037-ee2e189dfa8c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:35.350000+00:00
-- started: 2026-07-28T13:42:35.450000+00:00
-- ended: 2026-07-28T13:42:35.644000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-58'
                ORDER BY Day_Index
