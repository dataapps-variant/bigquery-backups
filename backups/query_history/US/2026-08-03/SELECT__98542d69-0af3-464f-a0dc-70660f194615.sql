-- job_id: 98542d69-0af3-464f-a0dc-70660f194615
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:24:44.748000+00:00
-- started: 2026-08-03T12:24:44.826000+00:00
-- ended: 2026-08-03T12:24:46.604000+00:00


            SELECT cohort_date, activity_date, bc_number, user_count
            FROM `variant-finance-data-project.R100.R100_Historical_Main`
            WHERE Input_ID = 'Input-23' AND activity_date <= DATE('2026-08-02')
