-- job_id: 61913822-36e2-423e-b054-917dfe74c9e4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:59.985000+00:00
-- started: 2026-07-28T13:41:00.079000+00:00
-- ended: 2026-07-28T13:41:00.454000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-43'
                ORDER BY Day_Index
