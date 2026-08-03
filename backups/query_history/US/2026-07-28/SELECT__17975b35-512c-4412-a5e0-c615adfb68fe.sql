-- job_id: 17975b35-512c-4412-a5e0-c615adfb68fe
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:03:41.207000+00:00
-- started: 2026-07-28T10:03:41.305000+00:00
-- ended: 2026-07-28T10:03:42.945000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-41' AND activity_date <= DATE('2026-07-27')
