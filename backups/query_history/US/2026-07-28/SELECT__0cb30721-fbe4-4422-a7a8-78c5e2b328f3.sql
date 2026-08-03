-- job_id: 0cb30721-fbe4-4422-a7a8-78c5e2b328f3
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:39.384000+00:00
-- started: 2026-07-28T13:39:39.467000+00:00
-- ended: 2026-07-28T13:39:39.662000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-30'
                ORDER BY Day_Index
