-- job_id: 572ec07e-eb4b-49b4-84ab-8564f76382f9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:47.707000+00:00
-- started: 2026-07-28T13:37:47.762000+00:00
-- ended: 2026-07-28T13:37:47.917000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-12'
                ORDER BY Day_Index
