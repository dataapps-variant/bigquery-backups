-- job_id: c7f125bc-484b-439e-be46-ec108b874eae
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T07:34:55.581000+00:00
-- started: 2026-07-30T07:34:56.063000+00:00
-- ended: 2026-07-30T07:34:57.276000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
