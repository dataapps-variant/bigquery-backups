-- job_id: job_VbUFAf4G-BaNHYBFHbV6l_7-NN-f
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T05:46:09.065000+00:00
-- started: 2026-07-30T05:46:09.504000+00:00
-- ended: 2026-07-30T05:46:10.785000+00:00

DELETE FROM `TikTok_JF_Campaigns` WHERE `TikTok_JF_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_Campaigns_bdb81062_8297_49c7_bc13_0e5eb02dca57` AS main_table_alias)
