-- job_id: feeb9332-e47b-4a95-9d49-1ce323756098
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:39:05.259000+00:00
-- started: 2026-07-28T13:39:05.364000+00:00
-- ended: 2026-07-28T13:39:06.679000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-24' AND bc_number = 0
                GROUP BY cohort_date
