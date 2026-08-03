-- job_id: 82477334-06a2-418a-9d6b-947806b26d47
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T07:33:18.428000+00:00
-- started: 2026-08-01T07:33:18.753000+00:00
-- ended: 2026-08-01T07:33:19.826000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
