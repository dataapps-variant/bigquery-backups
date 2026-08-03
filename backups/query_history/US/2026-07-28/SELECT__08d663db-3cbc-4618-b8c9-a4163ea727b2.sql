-- job_id: 08d663db-3cbc-4618-b8c9-a4163ea727b2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:03.034000+00:00
-- started: 2026-07-28T13:42:03.085000+00:00
-- ended: 2026-07-28T13:42:03.353000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-53'
                ORDER BY Day_Index
