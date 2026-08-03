-- job_id: job_OMIv_XHCVY6I4-Zp86sMC8HgvNkP
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T05:46:05.561000+00:00
-- started: 2026-08-02T05:46:05.849000+00:00
-- ended: 2026-08-02T05:46:06.732000+00:00

DELETE FROM `TikTok_JF_Campaigns` WHERE `TikTok_JF_Campaigns`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_Campaigns_26c45849_af96_4a82_9ea2_944e10d5e4f4` AS main_table_alias)
