-- job_id: 16b78436-05dd-4bdf-97ef-7d923fe8783c
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T07:35:02.972000+00:00
-- started: 2026-07-30T07:35:03.311000+00:00
-- ended: 2026-07-30T07:35:16.254000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
