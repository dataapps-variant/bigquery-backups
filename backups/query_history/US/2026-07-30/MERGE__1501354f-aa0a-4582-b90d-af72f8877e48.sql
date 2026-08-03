-- job_id: 1501354f-aa0a-4582-b90d-af72f8877e48
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: MERGE
-- created: 2026-07-30T12:00:37.746000+00:00
-- started: 2026-07-30T12:00:38.298000+00:00
-- ended: 2026-07-30T12:00:39.416000+00:00


    MERGE INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets` T
    USING `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets_stg_87d308a8` S
    ON  T.event_date          = S.event_date
    AND T.account_name        = S.account_name
    AND T.display_url_domain  = S.display_url_domain
    WHEN MATCHED THEN UPDATE SET
        T.impression_share        = S.impression_share,
        T.overlap_rate            = S.overlap_rate,
        T.position_above_rate     = S.position_above_rate,
        T.top_of_page_rate        = S.top_of_page_rate,
        T.abs_top_of_page_rate    = S.abs_top_of_page_rate,
        T.outranking_share        = S.outranking_share
    WHEN NOT MATCHED THEN INSERT (
        event_date, account_name, display_url_domain,
        impression_share, overlap_rate, position_above_rate,
        top_of_page_rate, abs_top_of_page_rate, outranking_share
    ) VALUES (
        S.event_date, S.account_name, S.display_url_domain,
        S.impression_share, S.overlap_rate, S.position_above_rate,
        S.top_of_page_rate, S.abs_top_of_page_rate, S.outranking_share
    )
