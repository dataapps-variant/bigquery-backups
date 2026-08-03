-- job_id: aab0033a-0968-4281-b81f-f032ee02a66b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-31T15:02:17.961000+00:00
-- started: 2026-07-31T15:02:18.072000+00:00
-- ended: 2026-07-31T15:02:18.194000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
