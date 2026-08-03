-- job_id: ca6bacb9-7398-4862-a4eb-5d82cefdb7a6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:07.857000+00:00
-- started: 2026-07-28T13:37:07.964000+00:00
-- ended: 2026-07-28T13:37:08.154000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-6'
                ORDER BY Day_Index
