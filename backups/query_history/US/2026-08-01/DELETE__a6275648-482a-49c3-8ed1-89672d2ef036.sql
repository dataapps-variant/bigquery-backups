-- job_id: a6275648-482a-49c3-8ed1-89672d2ef036
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-01T07:33:33.627000+00:00
-- started: 2026-08-01T07:33:33.993000+00:00
-- ended: 2026-08-01T07:33:35.217000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
