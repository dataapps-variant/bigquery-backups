-- job_id: 46fe0db2-a284-437b-bea2-76b9dd422fe4
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T12:45:12.556000+00:00
-- started: 2026-07-30T12:45:12.804000+00:00
-- ended: 2026-07-30T12:45:13.024000+00:00


        SELECT app_name, display_url_domain, impression_share, rank_today, rank_yesterday, rank_change
        FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
        WHERE event_date = (
            SELECT MAX(event_date) FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test.auction_insights_ranked`
            WHERE event_date >= DATE_SUB(CURRENT_DATE('Asia/Kolkata'), INTERVAL 2 DAY)
        )
        AND display_url_domain LIKE 'You (%'
