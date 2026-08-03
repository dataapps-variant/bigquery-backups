-- job_id: e1083501-e8b8-4bb2-bcf4-950a1548866a
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:30:23.345000+00:00
-- started: 2026-07-28T14:30:23.429000+00:00
-- ended: 2026-07-28T14:30:25.333000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-8' AND activity_date <= DATE('2026-07-27')
