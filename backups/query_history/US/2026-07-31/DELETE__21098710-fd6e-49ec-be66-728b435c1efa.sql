-- job_id: 21098710-fd6e-49ec-be66-728b435c1efa
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T07:35:07.090000+00:00
-- started: 2026-07-31T07:35:07.452000+00:00
-- ended: 2026-07-31T07:35:08.546000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
