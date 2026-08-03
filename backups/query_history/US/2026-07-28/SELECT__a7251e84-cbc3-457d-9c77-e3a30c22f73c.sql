-- job_id: a7251e84-cbc3-457d-9c77-e3a30c22f73c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:29.189000+00:00
-- started: 2026-07-28T13:37:29.312000+00:00
-- ended: 2026-07-28T13:37:29.476000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-9'
                ORDER BY Day_Index
