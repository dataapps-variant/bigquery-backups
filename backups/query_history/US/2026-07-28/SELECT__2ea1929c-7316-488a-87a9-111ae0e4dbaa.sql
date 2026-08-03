-- job_id: 2ea1929c-7316-488a-87a9-111ae0e4dbaa
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:43.329000+00:00
-- started: 2026-07-28T14:30:43.406000+00:00
-- ended: 2026-07-28T14:30:45.203000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-9' AND activity_date <= DATE('2026-07-27')
