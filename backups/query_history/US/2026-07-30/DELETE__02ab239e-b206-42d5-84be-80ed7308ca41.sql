-- job_id: 02ab239e-b206-42d5-84be-80ed7308ca41
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T07:33:40.519000+00:00
-- started: 2026-07-30T07:33:40.886000+00:00
-- ended: 2026-07-30T07:33:42.049000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
