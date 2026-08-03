-- job_id: 9db17992-2557-4985-8303-24fe36a1e846
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T07:34:48.925000+00:00
-- started: 2026-07-30T07:34:49.342000+00:00
-- ended: 2026-07-30T07:34:50.884000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
