-- job_id: 1974f34e-c460-4dd1-b93a-06f41a01042e
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-03T07:34:38.854000+00:00
-- started: 2026-08-03T07:34:39.186000+00:00
-- ended: 2026-08-03T07:34:40.401000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
