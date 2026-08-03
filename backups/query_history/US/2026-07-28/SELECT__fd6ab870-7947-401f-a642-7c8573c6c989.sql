-- job_id: fd6ab870-7947-401f-a642-7c8573c6c989
-- user: dataapps@variant.net
-- statement_type: SELECT
-- created: 2026-07-28T11:22:54.992000+00:00
-- started: 2026-07-28T11:22:55.126000+00:00
-- ended: 2026-07-28T11:22:55.341000+00:00

SELECT `Spend_Country_Code_AFID` AS splt, `Product_Name_Final` AS grp, `Billing_Cycle` AS xval, SUM(`NET_Retention_rate`) AS `NET_Retention_rate`, SUM(`Net_ARPU_Discounted`) AS `Net_ARPU_Discounted`, SUM(`Net_LTV_Discounted`) AS `Net_LTV_Discounted`, SUM(`Retention_rate`) AS `Retention_rate` FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Crystal_Ball` WHERE `Report_date` = @rdate AND CONCAT(`Product_Name_Final`, '|', `Spend_Country_Code_AFID`) IN UNNEST(@plan_pairs) GROUP BY splt, grp, xval ORDER BY splt, grp, xval
