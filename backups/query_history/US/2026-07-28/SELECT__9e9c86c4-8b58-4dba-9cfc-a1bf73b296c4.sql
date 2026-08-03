-- job_id: 9e9c86c4-8b58-4dba-9cfc-a1bf73b296c4
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:05:04.281000+00:00
-- started: 2026-07-28T10:05:04.344000+00:00
-- ended: 2026-07-28T10:05:06.318000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-56' AND activity_date <= DATE('2026-07-27')
