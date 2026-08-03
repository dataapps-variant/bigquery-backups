-- job_id: scheduled_query_6a77bedb-0000-2852-8e73-089e082668b0
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-31T07:00:05.456000+00:00
-- started: 2026-07-31T07:00:05.536000+00:00
-- ended: 2026-07-31T07:00:46.481000+00:00

DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.ad_performance_snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.ad_performance_snapshot`
CLONE `variant-finance-data-project.vatiant_finance_Google_Query_Test.ad_performance`;

DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.campaign_performance_snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.campaign_performance_snapshot`
CLONE `variant-finance-data-project.vatiant_finance_Google_Query_Test.campaign_performance`;


DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.location_view_snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.location_view_snapshot`
CLONE `variant-finance-data-project.vatiant_finance_Google_Query_Test.location_view`;
