-- job_id: affd3281-e6fd-42c7-9e8e-22af13b56e61
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T07:33:22.962000+00:00
-- started: 2026-08-02T07:33:23.327000+00:00
-- ended: 2026-08-02T07:33:24.345000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
