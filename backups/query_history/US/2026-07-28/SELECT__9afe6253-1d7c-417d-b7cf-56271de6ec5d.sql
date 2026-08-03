-- job_id: 9afe6253-1d7c-417d-b7cf-56271de6ec5d
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:52.202000+00:00
-- started: 2026-07-28T14:32:52.257000+00:00
-- ended: 2026-07-28T14:32:53.866000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-31' AND activity_date <= DATE('2026-07-27')
