-- job_id: d7aaf973-bec5-4fea-abfd-2b6a2682611b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:00:46.762000+00:00
-- started: 2026-07-28T10:00:46.836000+00:00
-- ended: 2026-07-28T10:00:48.388000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-10' AND activity_date <= DATE('2026-07-27')
