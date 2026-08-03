-- job_id: 956665f1-7bf3-4f03-9263-89cb1e9608e7
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:35:17.820000+00:00
-- started: 2026-07-28T14:35:17.915000+00:00
-- ended: 2026-07-28T14:35:19.581000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-58' AND activity_date <= DATE('2026-07-27')
