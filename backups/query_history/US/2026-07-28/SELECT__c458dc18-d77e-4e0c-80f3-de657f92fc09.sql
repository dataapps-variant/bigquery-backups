-- job_id: c458dc18-d77e-4e0c-80f3-de657f92fc09
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:57.824000+00:00
-- started: 2026-07-28T13:38:57.866000+00:00
-- ended: 2026-07-28T13:38:58.011000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-23'
                ORDER BY Day_Index
