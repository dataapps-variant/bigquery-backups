-- job_id: 8d8c318c-2a2e-4cb1-ae84-663dd4c2fbb9
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:21:17.762000+00:00
-- started: 2026-08-03T12:21:17.860000+00:00
-- ended: 2026-08-03T12:21:18.096000+00:00


    SELECT * FROM `variant-finance-data-project.R100.R100_Inputs_Full`
    WHERE Inputs_to_Process = TRUE AND Plan_Code IS NOT NULL
    ORDER BY CAST(REPLACE(Input_ID, 'Input-', '') AS INT64)
