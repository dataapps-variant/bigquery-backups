-- job_id: 139c8e12-719e-4717-acd7-3da35c054e3c
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T07:34:53.172000+00:00
-- started: 2026-07-29T07:34:53.551000+00:00
-- ended: 2026-07-29T07:34:55.003000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
