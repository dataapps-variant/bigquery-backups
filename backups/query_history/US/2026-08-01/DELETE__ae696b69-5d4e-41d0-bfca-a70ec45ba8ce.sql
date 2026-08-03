-- job_id: ae696b69-5d4e-41d0-bfca-a70ec45ba8ce
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T07:34:43.842000+00:00
-- started: 2026-08-01T07:34:44.237000+00:00
-- ended: 2026-08-01T07:34:45.465000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
