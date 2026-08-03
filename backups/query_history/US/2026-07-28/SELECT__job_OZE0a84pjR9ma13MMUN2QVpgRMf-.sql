-- job_id: job_OZE0a84pjR9ma13MMUN2QVpgRMf-
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T09:53:44.191000+00:00
-- started: 2026-07-28T09:53:44.277000+00:00
-- ended: 2026-07-28T09:53:44.646000+00:00

    SELECT Updated_Cust_ID
    FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_V_Merged_TBL`
    WHERE Product_Name_Final_Merged = "PD4988PTAA"
      AND Date_of_Sale <= "2026-05-01"
      AND Billing_Cycle_Updated = 0
      AND AFID_CHANNEL = 15
    ORDER BY Date_of_Sale DESC
    LIMIT 7000
