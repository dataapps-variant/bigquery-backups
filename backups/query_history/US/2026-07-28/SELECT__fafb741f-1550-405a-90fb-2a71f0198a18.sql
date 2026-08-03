-- job_id: fafb741f-1550-405a-90fb-2a71f0198a18
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:36:53.802000+00:00
-- started: 2026-07-28T13:36:54.259000+00:00
-- ended: 2026-07-28T13:36:54.465000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-4'
                ORDER BY Day_Index
