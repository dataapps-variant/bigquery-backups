-- job_id: 86e1e595-b0d6-4156-b647-9d29fb86dc1e
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-28T07:33:46.019000+00:00
-- started: 2026-07-28T07:33:46.361000+00:00
-- ended: 2026-07-28T07:33:47.719000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
