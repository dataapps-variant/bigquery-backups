-- job_id: d2f683e8-866b-4776-bb64-f0e23848a27f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:35:03.125000+00:00
-- started: 2026-07-28T14:35:03.219000+00:00
-- ended: 2026-07-28T14:35:05.023000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-56' AND activity_date <= DATE('2026-07-27')
