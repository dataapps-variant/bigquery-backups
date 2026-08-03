-- job_id: 0e9dae9c-689e-476c-8abb-17e4a9927559
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:41.269000+00:00
-- started: 2026-07-28T13:37:41.379000+00:00
-- ended: 2026-07-28T13:37:41.563000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-11'
                ORDER BY Day_Index
