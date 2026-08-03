-- job_id: ce19e7fc-45d3-4e40-aed1-6123ad177636
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:39.351000+00:00
-- started: 2026-07-28T14:33:39.427000+00:00
-- ended: 2026-07-28T14:33:40.919000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-40' AND activity_date <= DATE('2026-07-27')
