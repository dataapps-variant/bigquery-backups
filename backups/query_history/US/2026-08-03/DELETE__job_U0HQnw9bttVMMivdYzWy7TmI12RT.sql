-- job_id: job_U0HQnw9bttVMMivdYzWy7TmI12RT
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T05:46:11.455000+00:00
-- started: 2026-08-03T05:46:11.816000+00:00
-- ended: 2026-08-03T05:46:25.441000+00:00

DELETE FROM `TikTok_JF_Ads` WHERE `TikTok_JF_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_Ads_5ce823f6_8fbb_4dac_b71d_f3e3944de235` AS main_table_alias)
