-- job_id: 78f64178-884b-448c-807e-bccfcc0d230a
-- user: bq-uploader@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T10:39:19.494000+00:00
-- started: 2026-07-28T10:39:19.599000+00:00
-- ended: 2026-07-28T10:39:19.825000+00:00

SELECT DISTINCT `Spend_Country_Code_AFID` AS c FROM `variant-finance-data-project.Icarus_Spend_Country_AFID.SCA_7K_30D_Main_Table` WHERE `Spend_Country_Code_AFID` IS NOT NULL ORDER BY c
