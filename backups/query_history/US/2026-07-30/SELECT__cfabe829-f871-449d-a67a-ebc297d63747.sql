-- job_id: cfabe829-f871-449d-a67a-ebc297d63747
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T16:11:00.956000+00:00
-- started: 2026-07-30T16:11:01.105000+00:00
-- ended: 2026-07-30T16:11:01.438000+00:00


    SELECT * FROM `variant-finance-data-project.R100.R100_Inputs_Full`
    WHERE Inputs_to_Process = TRUE AND Plan_Code IS NOT NULL
    ORDER BY CAST(REPLACE(Input_ID, 'Input-', '') AS INT64)
