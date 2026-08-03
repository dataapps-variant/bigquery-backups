-- job_id: e3925db2-3596-401c-9ee2-61d944968c87
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T07:33:35.635000+00:00
-- started: 2026-08-02T07:33:35.983000+00:00
-- ended: 2026-08-02T07:33:37.111000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
