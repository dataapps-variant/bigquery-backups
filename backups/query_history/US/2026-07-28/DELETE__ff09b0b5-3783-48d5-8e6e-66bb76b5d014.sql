-- job_id: ff09b0b5-3783-48d5-8e6e-66bb76b5d014
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T07:33:32.296000+00:00
-- started: 2026-07-28T07:33:32.660000+00:00
-- ended: 2026-07-28T07:33:33.716000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
