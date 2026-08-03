-- job_id: 08aba24c-0874-48c0-a88d-ff08f0ed41a9
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T07:34:38.778000+00:00
-- started: 2026-08-02T07:34:39.335000+00:00
-- ended: 2026-08-02T07:34:40.483000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
