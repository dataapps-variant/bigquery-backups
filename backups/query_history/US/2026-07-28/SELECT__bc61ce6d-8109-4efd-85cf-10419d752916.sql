-- job_id: bc61ce6d-8109-4efd-85cf-10419d752916
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:36:55.842000+00:00
-- started: 2026-07-28T13:36:56.044000+00:00
-- ended: 2026-07-28T13:36:57.576000+00:00


                SELECT cohort_date, SUM(user_count) AS entry_users
                FROM `variant-finance-data-project.R100.R100_Historical_Main`
                WHERE Input_ID = 'Input-4' AND bc_number = 0
                GROUP BY cohort_date
