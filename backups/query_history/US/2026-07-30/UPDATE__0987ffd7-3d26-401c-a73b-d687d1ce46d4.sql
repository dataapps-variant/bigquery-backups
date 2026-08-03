-- job_id: 0987ffd7-3d26-401c-a73b-d687d1ce46d4
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-30T12:00:39.876000+00:00
-- started: 2026-07-30T12:00:40.240000+00:00
-- ended: 2026-07-30T12:00:43.829000+00:00


    UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets` T
    SET T.App_Name = D.App_Name
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Dim_auction_app_name` D
    WHERE T.account_name = D.account_name
    AND T.App_Name IS NULL
