-- job_id: a861dfa0-f05a-4569-ada7-11e8c785bb49
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:37:01.359000+00:00
-- started: 2026-07-28T13:37:01.439000+00:00
-- ended: 2026-07-28T13:37:01.653000+00:00


                SELECT Day_Index, BC_Number, Is_Trial, Daily_Refund_Rate
                FROM `variant-finance-data-project.R100.R100_Refund_Daily_Curve`
                WHERE Input_ID = 'Input-5'
                ORDER BY Day_Index
