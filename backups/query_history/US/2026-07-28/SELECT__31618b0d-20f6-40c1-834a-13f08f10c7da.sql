-- job_id: 31618b0d-20f6-40c1-834a-13f08f10c7da
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:32.673000+00:00
-- started: 2026-07-28T14:32:32.730000+00:00
-- ended: 2026-07-28T14:32:34.329000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-27' AND activity_date <= DATE('2026-07-27')
