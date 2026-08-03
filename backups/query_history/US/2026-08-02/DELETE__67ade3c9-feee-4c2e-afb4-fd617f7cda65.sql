-- job_id: 67ade3c9-feee-4c2e-afb4-fd617f7cda65
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T07:33:29.292000+00:00
-- started: 2026-08-02T07:33:29.710000+00:00
-- ended: 2026-08-02T07:33:30.876000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
