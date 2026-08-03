-- job_id: a24ceab2-493e-4b81-9051-5a43a8fc2c62
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:09.365000+00:00
-- started: 2026-07-28T13:39:09.461000+00:00
-- ended: 2026-07-28T13:39:09.655000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-25'
                ORDER BY Day_Index
