-- job_id: 2294d525-0ae4-4252-988b-5664ccbf53e5
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:56.987000+00:00
-- started: 2026-07-28T13:41:57.090000+00:00
-- ended: 2026-07-28T13:41:57.277000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-52'
                ORDER BY Day_Index
