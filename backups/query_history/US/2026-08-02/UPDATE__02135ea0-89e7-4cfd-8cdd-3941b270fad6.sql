-- job_id: 02135ea0-89e7-4cfd-8cdd-3941b270fad6
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-08-02T12:00:56.705000+00:00
-- started: 2026-08-02T12:00:57.119000+00:00
-- ended: 2026-08-02T12:00:58.383000+00:00


    UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets` T
    SET T.App_Name = D.App_Name
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Dim_auction_app_name` D
    WHERE T.account_name = D.account_name
    AND T.App_Name IS NULL
