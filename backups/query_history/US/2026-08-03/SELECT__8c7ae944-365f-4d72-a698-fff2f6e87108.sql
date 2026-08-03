-- job_id: 8c7ae944-365f-4d72-a698-fff2f6e87108
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:00:25.100000+00:00
-- started: 2026-08-03T12:00:25.372000+00:00
-- ended: 2026-08-03T12:00:27.407000+00:00


        SELECT Order_Id FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF`
        GROUP BY Order_Id
        HAVING COUNT(Order_Id) > 1;
