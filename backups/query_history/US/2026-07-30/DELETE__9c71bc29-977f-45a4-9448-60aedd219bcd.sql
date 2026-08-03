-- job_id: 9c71bc29-977f-45a4-9448-60aedd219bcd
-- user: openai-ads-bq-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-07-30T07:33:34.703000+00:00
-- started: 2026-07-30T07:33:35.180000+00:00
-- ended: 2026-07-30T07:33:36.202000+00:00


        DELETE FROM `variant-finance-data-project.OpenAI_Ads.openai_ads_campaign_report`
        WHERE `Day` BETWEEN @since AND @until
          AND `Account name` = @name
