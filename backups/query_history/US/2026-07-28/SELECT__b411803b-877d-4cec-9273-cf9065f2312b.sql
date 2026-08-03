-- job_id: b411803b-877d-4cec-9273-cf9065f2312b
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:34:19.826000+00:00
-- started: 2026-07-28T14:34:19.903000+00:00
-- ended: 2026-07-28T14:34:21.304000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-45' AND activity_date <= DATE('2026-07-27')
