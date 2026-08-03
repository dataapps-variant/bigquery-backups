-- job_id: 43b53308-70b4-4678-afad-8d021b08f2b2
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T07:35:07.351000+00:00
-- started: 2026-07-29T07:35:07.720000+00:00
-- ended: 2026-07-29T07:35:08.899000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
