-- job_id: b7775906-69f8-4850-a082-7310b75214c1
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T07:33:37.494000+00:00
-- started: 2026-07-31T07:33:37.823000+00:00
-- ended: 2026-07-31T07:33:39.136000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
