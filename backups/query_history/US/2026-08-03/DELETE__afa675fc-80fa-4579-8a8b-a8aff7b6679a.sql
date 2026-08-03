-- job_id: afa675fc-80fa-4579-8a8b-a8aff7b6679a
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T07:35:45.708000+00:00
-- started: 2026-08-03T07:35:46.185000+00:00
-- ended: 2026-08-03T07:35:47.185000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
