-- job_id: 36c6ab96-7fcf-43a8-8be2-159594b55a93
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T07:34:51.607000+00:00
-- started: 2026-08-01T07:34:51.994000+00:00
-- ended: 2026-08-01T07:34:52.995000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
