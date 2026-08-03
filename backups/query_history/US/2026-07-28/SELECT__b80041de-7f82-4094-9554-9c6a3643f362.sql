-- job_id: b80041de-7f82-4094-9554-9c6a3643f362
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:50.984000+00:00
-- started: 2026-07-28T13:41:51.033000+00:00
-- ended: 2026-07-28T13:41:51.209000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-51'
                ORDER BY Day_Index
