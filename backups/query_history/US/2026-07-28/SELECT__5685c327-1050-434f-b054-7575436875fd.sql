-- job_id: 5685c327-1050-434f-b054-7575436875fd
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:35.293000+00:00
-- started: 2026-07-28T13:37:35.359000+00:00
-- ended: 2026-07-28T13:37:35.535000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-10'
                ORDER BY Day_Index
