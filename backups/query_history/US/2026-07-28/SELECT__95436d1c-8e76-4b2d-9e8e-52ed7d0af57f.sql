-- job_id: 95436d1c-8e76-4b2d-9e8e-52ed7d0af57f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:57.798000+00:00
-- started: 2026-07-28T13:39:57.880000+00:00
-- ended: 2026-07-28T13:39:58.053000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-33'
                ORDER BY Day_Index
