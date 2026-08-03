-- job_id: 5b0cf225-101a-47d2-8a17-9be7e16e85f1
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T07:35:12.830000+00:00
-- started: 2026-07-31T07:35:13.377000+00:00
-- ended: 2026-07-31T07:35:14.620000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
