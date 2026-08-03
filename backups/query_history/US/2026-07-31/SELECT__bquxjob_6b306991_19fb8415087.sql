-- job_id: bquxjob_6b306991_19fb8415087
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-31T12:58:42.941000+00:00
-- started: 2026-07-31T12:58:43.059000+00:00
-- ended: 2026-07-31T12:58:43.091000+00:00

SELECT Input_ID, Entity, Plan_Code, Trial_Period, Renewal_Period,
       Trial_Price, Renewal_Price, Discount_Pct, Spend_Input, CAC_Input
FROM `variant-finance-data-project.R100.R100_Input_Selection`
ORDER BY Entity, Input_ID
