-- job_id: bc9bffb7-f18f-4ce1-aa1c-f95963ca6c80
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T07:35:02.442000+00:00
-- started: 2026-07-28T07:35:03.097000+00:00
-- ended: 2026-07-28T07:35:04.109000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
