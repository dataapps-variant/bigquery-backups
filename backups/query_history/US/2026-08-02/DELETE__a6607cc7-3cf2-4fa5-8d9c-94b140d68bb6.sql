-- job_id: a6607cc7-3cf2-4fa5-8d9c-94b140d68bb6
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T07:34:50.874000+00:00
-- started: 2026-08-02T07:34:51.205000+00:00
-- ended: 2026-08-02T07:34:52.340000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_geo_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
