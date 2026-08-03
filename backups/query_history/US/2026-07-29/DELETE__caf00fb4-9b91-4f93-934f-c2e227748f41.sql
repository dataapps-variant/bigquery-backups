-- job_id: caf00fb4-9b91-4f93-934f-c2e227748f41
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-29T07:33:39.101000+00:00
-- started: 2026-07-29T07:33:39.504000+00:00
-- ended: 2026-07-29T07:33:40.678000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
