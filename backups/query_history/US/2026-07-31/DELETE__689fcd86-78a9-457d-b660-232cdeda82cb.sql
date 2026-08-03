-- job_id: 689fcd86-78a9-457d-b660-232cdeda82cb
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T07:33:23.047000+00:00
-- started: 2026-07-31T07:33:23.420000+00:00
-- ended: 2026-07-31T07:33:24.488000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
