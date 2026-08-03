-- job_id: bc68f7c2-554c-49cc-8449-2222c7a58877
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:32:37.369000+00:00
-- started: 2026-07-28T14:32:37.455000+00:00
-- ended: 2026-07-28T14:32:38.811000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-28' AND activity_date <= DATE('2026-07-27')
