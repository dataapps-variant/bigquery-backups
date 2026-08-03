-- job_id: b92a3eae-4036-4b22-945d-f7849855a72b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:08.103000+00:00
-- started: 2026-07-28T13:41:08.175000+00:00
-- ended: 2026-07-28T13:41:08.368000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-44'
                ORDER BY Day_Index
