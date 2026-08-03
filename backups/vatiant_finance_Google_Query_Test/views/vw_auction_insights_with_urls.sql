CREATE VIEW `variant-finance-data-project.vatiant_finance_Google_Query_Test.vw_auction_insights_with_urls`
AS SELECT
    ai.event_date,
    ai.account_name,
    ai.display_url_domain,
    ai.impression_share,
    ai.overlap_rate,
    ai.position_above_rate,
    ai.top_of_page_rate,
    ai.abs_top_of_page_rate,
    ai.outranking_share,
    ap.final_url,
    ap.cost
FROM
    `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_sheets` ai
LEFT JOIN (
    SELECT
        event_date,
        account_name,
        ARRAY_AGG(final_url ORDER BY cost DESC LIMIT 1)[OFFSET(0)] AS final_url,
        SUM(cost) AS cost
    FROM
        `variant-finance-data-project.vatiant_finance_Google_Query_Test.ad_performance`
    GROUP BY
        event_date, account_name
) ap
ON  ai.event_date    = ap.event_date
AND ai.account_name  = ap.account_name;
