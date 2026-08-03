-- job_id: 21b4ccca-619e-4337-99f3-d9306bab1ada
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:48.527000+00:00
-- started: 2026-07-28T13:40:48.622000+00:00
-- ended: 2026-07-28T13:40:48.776000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-41'
                ORDER BY Day_Index
