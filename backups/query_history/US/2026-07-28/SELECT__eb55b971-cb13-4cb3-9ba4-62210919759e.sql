-- job_id: eb55b971-cb13-4cb3-9ba4-62210919759e
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:33:35.349000+00:00
-- started: 2026-07-28T14:33:35.447000+00:00
-- ended: 2026-07-28T14:33:37.007000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-39' AND activity_date <= DATE('2026-07-27')
