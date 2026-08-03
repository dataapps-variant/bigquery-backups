-- job_id: da03b374-2025-4f26-95ea-5cd385a0c7da
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:08.361000+00:00
-- started: 2026-07-28T10:03:08.436000+00:00
-- ended: 2026-07-28T10:03:10.060000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-35' AND activity_date <= DATE('2026-07-27')
