-- job_id: 0c51f3eb-4a3a-43ca-bf58-9394d9c3dd99
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T07:33:31.372000+00:00
-- started: 2026-07-29T07:33:31.943000+00:00
-- ended: 2026-07-29T07:33:33.968000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
