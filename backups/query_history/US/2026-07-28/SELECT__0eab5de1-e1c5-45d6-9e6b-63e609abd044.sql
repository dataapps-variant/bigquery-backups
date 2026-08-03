-- job_id: 0eab5de1-e1c5-45d6-9e6b-63e609abd044
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:00.127000+00:00
-- started: 2026-07-28T13:38:00.234000+00:00
-- ended: 2026-07-28T13:38:00.414000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-14'
                ORDER BY Day_Index
