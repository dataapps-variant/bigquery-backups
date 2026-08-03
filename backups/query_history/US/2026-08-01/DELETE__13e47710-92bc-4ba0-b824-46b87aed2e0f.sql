-- job_id: 13e47710-92bc-4ba0-b824-46b87aed2e0f
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T07:33:27.381000+00:00
-- started: 2026-08-01T07:33:27.758000+00:00
-- ended: 2026-08-01T07:33:29.052000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
