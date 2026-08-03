-- job_id: 9491f917-082d-4527-aace-a2a3a2de0984
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:36:28.481000+00:00
-- started: 2026-07-28T13:36:28.612000+00:00
-- ended: 2026-07-28T13:36:28.800000+00:00


    SELECT * FROM `variant-finance-data-project.R100.R100_Inputs_Full`
    WHERE Inputs_to_Process = TRUE AND Plan_Code IS NOT NULL
    ORDER BY CAST(REPLACE(Input_ID, 'Input-', '') AS INT64)
