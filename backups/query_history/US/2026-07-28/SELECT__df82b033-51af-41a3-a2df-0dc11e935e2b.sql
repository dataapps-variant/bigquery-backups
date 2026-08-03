-- job_id: df82b033-51af-41a3-a2df-0dc11e935e2b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:50.498000+00:00
-- started: 2026-07-28T14:34:50.573000+00:00
-- ended: 2026-07-28T14:34:52.135000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-53' AND activity_date <= DATE('2026-07-27')
