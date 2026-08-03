-- job_id: 9ade5953-bd53-4756-a221-e55250b6c333
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T07:35:38.517000+00:00
-- started: 2026-08-03T07:35:38.895000+00:00
-- ended: 2026-08-03T07:35:40.876000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
