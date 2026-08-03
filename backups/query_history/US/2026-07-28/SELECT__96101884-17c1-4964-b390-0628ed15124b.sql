-- job_id: 96101884-17c1-4964-b390-0628ed15124b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:14.591000+00:00
-- started: 2026-07-28T13:41:14.663000+00:00
-- ended: 2026-07-28T13:41:14.857000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-45'
                ORDER BY Day_Index
