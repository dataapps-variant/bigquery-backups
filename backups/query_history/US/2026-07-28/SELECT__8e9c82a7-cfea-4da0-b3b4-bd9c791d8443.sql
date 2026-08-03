-- job_id: 8e9c82a7-cfea-4da0-b3b4-bd9c791d8443
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-28T17:03:16.827000+00:00
-- started: 2026-07-28T17:03:16.940000+00:00
-- ended: 2026-07-28T17:03:17.055000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
