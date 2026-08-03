-- job_id: 65c7ffce-ac61-4223-8240-929c22954f18
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T07:35:52.868000+00:00
-- started: 2026-08-03T07:35:53.285000+00:00
-- ended: 2026-08-03T07:35:54.440000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
