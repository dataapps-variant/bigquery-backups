-- job_id: 2d2d1c17-6acc-4268-8572-dd6d5812f557
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:38:18.043000+00:00
-- started: 2026-07-28T13:38:18.253000+00:00
-- ended: 2026-07-28T13:38:18.423000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-17'
                ORDER BY Day_Index
