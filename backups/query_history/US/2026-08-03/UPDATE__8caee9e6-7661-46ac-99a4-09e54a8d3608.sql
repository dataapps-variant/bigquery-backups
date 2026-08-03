-- job_id: 8caee9e6-7661-46ac-99a4-09e54a8d3608
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-03T12:01:46.501000+00:00
-- started: 2026-08-03T12:01:46.880000+00:00
-- ended: 2026-08-03T12:01:48.084000+00:00


    UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets` T
    SET T.App_Name = D.App_Name
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Dim_auction_app_name` D
    WHERE T.account_name = D.account_name
    AND T.App_Name IS NULL
