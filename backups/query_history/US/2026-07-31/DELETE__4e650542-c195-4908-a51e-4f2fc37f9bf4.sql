-- job_id: 4e650542-c195-4908-a51e-4f2fc37f9bf4
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T07:35:00.836000+00:00
-- started: 2026-07-31T07:35:01.213000+00:00
-- ended: 2026-07-31T07:35:02.359000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
