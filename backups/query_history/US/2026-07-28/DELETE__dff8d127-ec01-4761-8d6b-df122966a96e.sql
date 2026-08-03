-- job_id: dff8d127-ec01-4761-8d6b-df122966a96e
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T07:33:39.349000+00:00
-- started: 2026-07-28T07:33:39.755000+00:00
-- ended: 2026-07-28T07:33:40.788000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
