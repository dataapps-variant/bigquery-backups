-- job_id: 05ed2a70-dc9d-4d5f-b21a-62c773b292f3
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-30T06:02:29.274000+00:00
-- started: 2026-07-30T06:02:29.368000+00:00
-- ended: 2026-07-30T06:02:29.483000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
