-- job_id: 8cfcb848-d8d3-4200-abe5-05e8728fa82d
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: UPDATE
-- created: 2026-07-31T08:09:14.106000+00:00
-- started: 2026-07-31T08:09:14.553000+00:00
-- ended: 2026-07-31T08:09:15.706000+00:00


    UPDATE `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets` T
    SET T.App_Name = D.App_Name
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.Dim_auction_app_name` D
    WHERE T.account_name = D.account_name
    AND T.App_Name IS NULL
