-- job_id: e7c45450-3778-48fb-b879-dc0909c209ea
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T13:10:10.588000+00:00
-- started: 2026-07-28T13:10:10.722000+00:00
-- ended: 2026-07-28T13:10:10.923000+00:00


    SELECT * FROM `variant-finance-data-project.R100.R100_Inputs_Full`
    WHERE Inputs_to_Process = TRUE AND Plan_Code IS NOT NULL
    ORDER BY CAST(REPLACE(Input_ID, 'Input-', '') AS INT64)
