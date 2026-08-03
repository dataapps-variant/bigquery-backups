-- job_id: 57e7a58f-1d8f-4a12-8345-340e26f12b12
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:45:15.796000+00:00
-- started: 2026-08-03T12:45:15.881000+00:00
-- ended: 2026-08-03T12:45:16.084000+00:00


        SELECT app_name, display_url_domain, impression_share, rank_today, rank_yesterday, rank_change
        FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
        WHERE event_date = (
            SELECT MAX(event_date) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
            WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 2 DAY)
        )
        AND display_url_domain LIKE 'You (%'
