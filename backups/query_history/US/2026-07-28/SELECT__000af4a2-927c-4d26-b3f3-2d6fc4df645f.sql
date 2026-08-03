-- job_id: 000af4a2-927c-4d26-b3f3-2d6fc4df645f
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T14:28:56.874000+00:00
-- started: 2026-07-28T14:28:56.988000+00:00
-- ended: 2026-07-28T14:28:57.188000+00:00


    SELECT * FROM `variant-finance-data-project.R100.R100_Inputs_Full`
    WHERE Inputs_to_Process = TRUE AND Plan_Code IS NOT NULL
    ORDER BY CAST(REPLACE(Input_ID, 'Input-', '') AS INT64)
