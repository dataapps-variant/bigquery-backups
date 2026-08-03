-- job_id: job_8Vnj1i0mUQWeGDVURfQyixhhpQdC
-- user: r100-pipeline@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T11:22:06.804000+00:00
-- started: 2026-07-28T11:22:06.878000+00:00
-- ended: 2026-07-28T11:22:07.069000+00:00

SELECT Input_ID, Entity, Plan_Code, Plan_Activity, Retention_Curve, Trial_Period, Trial_Price, Discount_Pct, Spend_Input, Weekly_Spend_Curve, Extension_Scenarios_Retentions, Extension_Scenarios_Refunds FROM `variant-finance-data-project.R100.R100_Inputs_Full` WHERE Input_ID IN ('Input-1','Input-3') ORDER BY Input_ID
