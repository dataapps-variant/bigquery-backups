-- job_id: f5d02a15-1bdc-4b87-9735-a698265161bf
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T07:34:31.687000+00:00
-- started: 2026-08-02T07:34:32.011000+00:00
-- ended: 2026-08-02T07:34:33.079000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
