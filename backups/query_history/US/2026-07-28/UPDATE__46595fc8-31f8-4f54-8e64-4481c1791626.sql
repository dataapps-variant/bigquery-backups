-- job_id: 46595fc8-31f8-4f54-8e64-4481c1791626
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-28T12:01:06.476000+00:00
-- started: 2026-07-28T12:01:06.951000+00:00
-- ended: 2026-07-28T12:01:07.995000+00:00


    UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets` T
    SET T.App_Name = D.App_Name
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Dim_auction_app_name` D
    WHERE T.account_name = D.account_name
    AND T.App_Name IS NULL
