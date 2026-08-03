-- job_id: 10f0fcd1-3ec8-48d1-9fcb-edb23ca3cc7e
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T07:34:55.726000+00:00
-- started: 2026-07-28T07:34:56.083000+00:00
-- ended: 2026-07-28T07:34:57.076000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
