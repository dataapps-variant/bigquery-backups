-- job_id: 0d5bfc39-065e-499b-9384-2341ead96c2b
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T07:33:24.774000+00:00
-- started: 2026-07-29T07:33:25.255000+00:00
-- ended: 2026-07-29T07:33:26.398000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
