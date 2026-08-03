-- job_id: e7eb214a-3ace-41d4-9d15-8f0a2276f802
-- user: google-ads-service@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: MERGE
-- created: 2026-07-28T05:30:18.545000+00:00
-- started: 2026-07-28T05:30:19.538000+00:00
-- ended: 2026-07-28T05:30:21.095000+00:00


        MERGE INTO `variant-finance-data-project.vatiant_finance_Google_Query_Test.ad_performance` T
        USING `variant-finance-data-project.vatiant_finance_Google_Query_Test.ad_performance_staging_256fd4fe` S
        ON  T.ad_id = S.ad_id
        AND T.adgroup_id = S.adgroup_id
        AND T.event_date = S.event_date
        AND T.external_customer_id = S.external_customer_id
        AND T.campaign_id = S.campaign_id
        AND IFNULL(T.final_url, '') = IFNULL(S.final_url, '')
        WHEN MATCHED THEN
          UPDATE SET
            T.account_name = S.account_name,
            T.campaign_type = S.campaign_type,
            T.final_url_suffix = S.final_url_suffix,
            T.cost = S.cost
        WHEN NOT MATCHED THEN
          INSERT (event_date, external_customer_id, account_name, campaign_id,
                  campaign_type, final_url, adgroup_id, ad_id, final_url_suffix, cost)
          VALUES (S.event_date, S.external_customer_id, S.account_name, S.campaign_id,
                  S.campaign_type, S.final_url, S.adgroup_id, S.ad_id, S.final_url_suffix, S.cost)
