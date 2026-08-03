-- job_id: 4b610808-bfe3-4d42-834f-e85fbad3ee87
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:42:22.636000+00:00
-- started: 2026-07-28T13:42:22.703000+00:00
-- ended: 2026-07-28T13:42:22.889000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-56'
                ORDER BY Day_Index
