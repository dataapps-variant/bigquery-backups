-- job_id: b3bbcae2-662a-4332-8b29-acc7c8572035
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:04.196000+00:00
-- started: 2026-07-28T10:05:04.275000+00:00
-- ended: 2026-07-28T10:05:05.949000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-32' AND activity_date <= DATE('2026-07-27')
