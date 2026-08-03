-- job_id: d4e65d50-dfdc-45b2-8c7c-8e309c8da27e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:15.739000+00:00
-- started: 2026-07-28T13:39:15.825000+00:00
-- ended: 2026-07-28T13:39:16.014000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-26'
                ORDER BY Day_Index
