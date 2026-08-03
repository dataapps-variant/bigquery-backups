-- job_id: a1cfa3a7-005c-49eb-a38f-124e07ee7717
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:27:06.143000+00:00
-- started: 2026-08-03T12:27:06.424000+00:00
-- ended: 2026-08-03T12:27:08.457000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-47' AND activity_date <= DATE('2026-08-02')
