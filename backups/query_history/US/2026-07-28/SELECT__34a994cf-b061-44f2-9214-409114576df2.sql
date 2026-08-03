-- job_id: 34a994cf-b061-44f2-9214-409114576df2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:45.519000+00:00
-- started: 2026-07-28T13:39:45.576000+00:00
-- ended: 2026-07-28T13:39:45.760000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-31'
                ORDER BY Day_Index
