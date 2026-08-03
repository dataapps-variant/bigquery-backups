-- job_id: b10e705a-7d33-4059-90a1-ca20611acefb
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:43.810000+00:00
-- started: 2026-07-28T13:38:43.887000+00:00
-- ended: 2026-07-28T13:38:44.084000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-21'
                ORDER BY Day_Index
