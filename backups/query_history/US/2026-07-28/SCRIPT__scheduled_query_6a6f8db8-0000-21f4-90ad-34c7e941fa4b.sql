-- job_id: scheduled_query_6a6f8db8-0000-21f4-90ad-34c7e941fa4b
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-28T07:00:15.504000+00:00
-- started: 2026-07-28T07:00:15.567000+00:00
-- ended: 2026-07-28T07:01:04.470000+00:00

DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.ad_performance_snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.ad_performance_snapshot`
CLONE `variant-finance-data-project.vatiant_finance_Google_Query_Test.ad_performance`;

DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.campaign_performance_snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.campaign_performance_snapshot`
CLONE `variant-finance-data-project.vatiant_finance_Google_Query_Test.campaign_performance`;


DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.location_view_snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.location_view_snapshot`
CLONE `variant-finance-data-project.vatiant_finance_Google_Query_Test.location_view`;
