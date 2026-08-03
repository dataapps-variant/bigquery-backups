-- job_id: 9dcabdf1-e40d-4948-8bc7-48b43ae2100c
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:31:38.101000+00:00
-- started: 2026-07-28T14:31:38.186000+00:00
-- ended: 2026-07-28T14:31:39.778000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-18' AND activity_date <= DATE('2026-07-27')
