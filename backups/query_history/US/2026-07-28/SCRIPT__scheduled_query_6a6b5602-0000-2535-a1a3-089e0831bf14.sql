-- job_id: scheduled_query_6a6b5602-0000-2535-a1a3-089e0831bf14
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-28T07:00:11.119000+00:00
-- started: 2026-07-28T07:00:11.177000+00:00
-- ended: 2026-07-28T07:00:57.695000+00:00

DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.Sticky_Data_Snapshots.Sticky_data_API_original_CN_2_Snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.Sticky_Data_Snapshots.Sticky_data_API_original_CN_2_Snapshot`
CLONE `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CN_2`;

DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.Sticky_Data_Snapshots.Sticky_data_API_original_CT_1_Snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.Sticky_Data_Snapshots.Sticky_data_API_original_CT_1_Snapshot`
CLONE `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_CT_1`;


DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.Sticky_Data_Snapshots.Sticky_data_API_original_PD_Snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.Sticky_Data_Snapshots.Sticky_data_API_original_PD_Snapshot`
CLONE `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_PD`;

DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.Sticky_Data_Snapshots.Sticky_data_API_original_AT_1_Snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.Sticky_Data_Snapshots.Sticky_data_API_original_AT_1_Snapshot`
CLONE `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_AT_1`;

DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.Sticky_Data_Snapshots.Sticky_data_API_original_FS_4_Snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.Sticky_Data_Snapshots.Sticky_data_API_original_FS_4_Snapshot`
CLONE `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_FS_4`;

DROP SNAPSHOT TABLE IF EXISTS `variant-finance-data-project.Sticky_Data_Snapshots.Sticky_data_API_original_JF_1_Snapshot`;

CREATE SNAPSHOT TABLE `variant-finance-data-project.Sticky_Data_Snapshots.Sticky_data_API_original_JF_1_Snapshot`
CLONE `variant-finance-data-project.Sticky_Data.Sticky_data_API_original_JF_1`;
