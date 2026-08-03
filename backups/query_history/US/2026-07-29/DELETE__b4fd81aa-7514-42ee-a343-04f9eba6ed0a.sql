-- job_id: b4fd81aa-7514-42ee-a343-04f9eba6ed0a
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T07:35:15.305000+00:00
-- started: 2026-07-29T07:35:15.729000+00:00
-- ended: 2026-07-29T07:35:16.914000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
