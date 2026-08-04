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
