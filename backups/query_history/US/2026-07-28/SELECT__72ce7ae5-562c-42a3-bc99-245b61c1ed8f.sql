-- job_id: 72ce7ae5-562c-42a3-bc99-245b61c1ed8f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:06:50.362000+00:00
-- started: 2026-07-28T10:06:50.412000+00:00
-- ended: 2026-07-28T10:06:50.970000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-58' AND activity_date <= DATE('2026-07-27')
