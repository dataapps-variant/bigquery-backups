-- job_id: job_zXmMdPp-QWBIIUVAT5oMGOTPiHHr
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T05:46:12.915000+00:00
-- started: 2026-07-31T05:46:13.186000+00:00
-- ended: 2026-07-31T05:46:14.237000+00:00

DELETE FROM `TikTok_JF_Ads` WHERE `TikTok_JF_Ads`.`Id` IN (SELECT main_table_alias.`Id`  FROM `TikTok_JF_Ads_f8274a52_dae2_417c_aaa8_be70f11f7a09` AS main_table_alias)
