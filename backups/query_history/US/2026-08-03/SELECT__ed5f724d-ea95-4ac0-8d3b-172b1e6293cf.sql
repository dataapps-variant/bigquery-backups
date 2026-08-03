-- job_id: ed5f724d-ea95-4ac0-8d3b-172b1e6293cf
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:26:06.303000+00:00
-- started: 2026-08-03T12:26:06.370000+00:00
-- ended: 2026-08-03T12:26:08.378000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-38' AND activity_date <= DATE('2026-08-02')
