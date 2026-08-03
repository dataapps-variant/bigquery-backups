-- job_id: 724f307f-4a7e-4da3-b493-ebce3fa767f7
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T07:34:31.408000+00:00
-- started: 2026-08-03T07:34:31.789000+00:00
-- ended: 2026-08-03T07:34:33.076000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
