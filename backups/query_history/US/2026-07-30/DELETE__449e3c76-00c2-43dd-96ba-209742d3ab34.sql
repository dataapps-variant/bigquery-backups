-- job_id: 449e3c76-00c2-43dd-96ba-209742d3ab34
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T07:33:28.018000+00:00
-- started: 2026-07-30T07:33:28.619000+00:00
-- ended: 2026-07-30T07:33:29.700000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_landing_page_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
