-- job_id: ca48fc28-363d-4433-8fbb-a782c56b4ae7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:04.209000+00:00
-- started: 2026-07-28T10:03:04.259000+00:00
-- ended: 2026-07-28T10:03:05.932000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-34' AND activity_date <= DATE('2026-07-27')
