-- job_id: b12b91e7-05f4-4e33-82bb-843bfaed28d7
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T19:01:29.700000+00:00
-- started: 2026-07-31T19:01:29.845000+00:00
-- ended: 2026-07-31T19:01:29.968000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
