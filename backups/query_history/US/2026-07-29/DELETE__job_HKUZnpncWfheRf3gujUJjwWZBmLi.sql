-- job_id: job_HKUZnpncWfheRf3gujUJjwWZBmLi
-- user: msads-917@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T05:46:06.726000+00:00
-- started: 2026-07-29T05:46:07.030000+00:00
-- ended: 2026-07-29T05:46:07.968000+00:00

DELETE FROM `MS_Ads_CT_AdPerformanceDailyReport` WHERE `Date` >= @p0
