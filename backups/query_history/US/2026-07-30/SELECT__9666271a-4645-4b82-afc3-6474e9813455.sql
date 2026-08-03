-- job_id: 9666271a-4645-4b82-afc3-6474e9813455
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T02:02:14.493000+00:00
-- started: 2026-07-30T02:02:14.659000+00:00
-- ended: 2026-07-30T02:02:14.781000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
