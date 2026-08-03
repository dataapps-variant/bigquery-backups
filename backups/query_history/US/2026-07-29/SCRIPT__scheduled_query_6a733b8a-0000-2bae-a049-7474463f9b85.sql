-- job_id: scheduled_query_6a733b8a-0000-2bae-a049-7474463f9b85
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-29T07:00:13.680000+00:00
-- started: 2026-07-29T07:00:13.760000+00:00
-- ended: 2026-07-29T07:00:58.825000+00:00

DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.ad_performance_snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.ad_performance_snapshot`
CLONE `variant-finance-data-project.vatiant_finance_Google_Query_Test.ad_performance`;

DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.campaign_performance_snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.campaign_performance_snapshot`
CLONE `variant-finance-data-project.vatiant_finance_Google_Query_Test.campaign_performance`;


DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.location_view_snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots.location_view_snapshot`
CLONE `variant-finance-data-project.vatiant_finance_Google_Query_Test.location_view`;
