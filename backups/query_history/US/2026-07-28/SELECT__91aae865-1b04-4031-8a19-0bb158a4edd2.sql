-- job_id: 91aae865-1b04-4031-8a19-0bb158a4edd2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:41:20.806000+00:00
-- started: 2026-07-28T13:41:20.938000+00:00
-- ended: 2026-07-28T13:41:21.122000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-46'
                ORDER BY Day_Index
