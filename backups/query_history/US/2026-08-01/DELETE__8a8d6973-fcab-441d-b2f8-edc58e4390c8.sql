-- job_id: 8a8d6973-fcab-441d-b2f8-edc58e4390c8
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T07:34:57.154000+00:00
-- started: 2026-08-01T07:34:57.534000+00:00
-- ended: 2026-08-01T07:34:58.610000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
