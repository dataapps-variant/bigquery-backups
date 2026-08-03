-- job_id: a6ab8e6a-0067-4b78-96c3-15f644bf4004
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T12:45:25.545000+00:00
-- started: 2026-07-28T12:45:25.635000+00:00
-- ended: 2026-07-28T12:45:25.858000+00:00


        SELECT app_name, display_url_domain, impression_share, rank_today, rank_yesterday, rank_change
        FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
        WHERE event_date = (
            SELECT MAX(event_date) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
            WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 2 DAY)
        )
        AND display_url_domain LIKE 'You (%'
