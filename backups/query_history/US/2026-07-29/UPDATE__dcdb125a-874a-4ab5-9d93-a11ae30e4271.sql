-- job_id: dcdb125a-874a-4ab5-9d93-a11ae30e4271
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-29T12:01:09.460000+00:00
-- started: 2026-07-29T12:01:09.800000+00:00
-- ended: 2026-07-29T12:01:10.962000+00:00


    UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets` T
    SET T.App_Name = D.App_Name
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Dim_auction_app_name` D
    WHERE T.account_name = D.account_name
    AND T.App_Name IS NULL
