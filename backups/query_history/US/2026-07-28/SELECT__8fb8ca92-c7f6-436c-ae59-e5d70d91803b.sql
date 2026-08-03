-- job_id: 8fb8ca92-c7f6-436c-ae59-e5d70d91803b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:03.804000+00:00
-- started: 2026-07-28T13:40:04.177000+00:00
-- ended: 2026-07-28T13:40:04.341000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-34'
                ORDER BY Day_Index
