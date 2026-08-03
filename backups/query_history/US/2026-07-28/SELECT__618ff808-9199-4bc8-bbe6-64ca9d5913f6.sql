-- job_id: 618ff808-9199-4bc8-bbe6-64ca9d5913f6
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:40:05.628000+00:00
-- started: 2026-07-28T13:40:05.762000+00:00
-- ended: 2026-07-28T13:40:07.639000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-34' AND bc_number = 0
                GROUP BY cohort_date
