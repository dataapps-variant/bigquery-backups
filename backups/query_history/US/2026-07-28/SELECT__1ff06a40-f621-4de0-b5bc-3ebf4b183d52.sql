-- job_id: 1ff06a40-f621-4de0-b5bc-3ebf4b183d52
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:33.688000+00:00
-- started: 2026-07-28T13:39:33.757000+00:00
-- ended: 2026-07-28T13:39:33.933000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-29'
                ORDER BY Day_Index
