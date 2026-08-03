-- job_id: scheduled_query_6a86a7eb-0000-2548-9a5c-30fd380f88f8
-- user: dataapps@variant.net
-- statement_type: SCRIPT
-- created: 2026-07-29T07:00:19.076000+00:00
-- started: 2026-07-29T07:00:19.115000+00:00
-- ended: 2026-07-29T07:02:28.949000+00:00

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
