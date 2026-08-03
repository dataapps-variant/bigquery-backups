-- job_id: 7ef37d88-974b-4768-ac72-b724e8c5f62c
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T07:34:47.584000+00:00
-- started: 2026-07-28T07:34:47.990000+00:00
-- ended: 2026-07-28T07:34:49.105000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
