-- job_id: 3e5277df-c309-4be1-8817-aba684a94455
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-31T07:33:29.714000+00:00
-- started: 2026-07-31T07:33:30.081000+00:00
-- ended: 2026-07-31T07:33:31.157000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
