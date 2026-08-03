-- job_id: b435762a-ee17-4156-b297-0ed66140a475
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T07:34:18.797000+00:00
-- started: 2026-08-03T07:34:19.197000+00:00
-- ended: 2026-08-03T07:34:20.270000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
