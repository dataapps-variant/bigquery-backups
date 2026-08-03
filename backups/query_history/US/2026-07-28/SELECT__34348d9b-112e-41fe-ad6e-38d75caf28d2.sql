-- job_id: 34348d9b-112e-41fe-ad6e-38d75caf28d2
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:10.354000+00:00
-- started: 2026-07-28T14:33:10.453000+00:00
-- ended: 2026-07-28T14:33:12.035000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-35' AND activity_date <= DATE('2026-07-27')
