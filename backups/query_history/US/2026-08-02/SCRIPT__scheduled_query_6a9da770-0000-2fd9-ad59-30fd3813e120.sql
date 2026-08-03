-- job_id: scheduled_query_6a9da770-0000-2fd9-ad59-30fd3813e120
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-08-02T07:00:18.411000+00:00
-- started: 2026-08-02T07:00:18.449000+00:00
-- ended: 2026-08-02T07:01:13.255000+00:00

DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.ad_performance_snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.ad_performance_snapshot`
CLONE `variant-finance-data-project.vatiant_finance_Google_Query_Test.ad_performance`;

DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.campaign_performance_snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.campaign_performance_snapshot`
CLONE `variant-finance-data-project.vatiant_finance_Google_Query_Test.campaign_performance`;


DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.location_view_snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.location_view_snapshot`
CLONE `variant-finance-data-project.vatiant_finance_Google_Query_Test.location_view`;
