-- job_id: job_HdNJGfXedAj799UxnFt8cTrnXYap
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-30T09:57:06.635000+00:00
-- started: 2026-07-30T09:57:06.724000+00:00
-- ended: 2026-07-30T09:57:07.124000+00:00

SELECT * FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL` 
where App_Name = "MB"
and Date_of_Sale >= "2026-06-30"
and Billing_Cycle_Updated = 0
and Spend_Country_Code_AFID = "OR"
