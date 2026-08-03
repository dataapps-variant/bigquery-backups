-- job_id: 5f87d6d0-354b-4fec-976a-5ba76e4108ed
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T12:45:10.175000+00:00
-- started: 2026-07-31T12:45:10.252000+00:00
-- ended: 2026-07-31T12:45:10.444000+00:00


        SELECT app_name, display_url_domain, impression_share, rank_today, rank_yesterday, rank_change
        FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
        WHERE event_date = (
            SELECT MAX(event_date) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
            WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 2 DAY)
        )
        AND display_url_domain LIKE 'You (%'
