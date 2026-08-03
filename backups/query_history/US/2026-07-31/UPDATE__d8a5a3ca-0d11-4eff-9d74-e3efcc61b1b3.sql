-- job_id: d8a5a3ca-0d11-4eff-9d74-e3efcc61b1b3
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-31T12:00:53.334000+00:00
-- started: 2026-07-31T12:00:53.651000+00:00
-- ended: 2026-07-31T12:00:54.894000+00:00


    UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets` T
    SET T.App_Name = D.App_Name
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Dim_auction_app_name` D
    WHERE T.account_name = D.account_name
    AND T.App_Name IS NULL
