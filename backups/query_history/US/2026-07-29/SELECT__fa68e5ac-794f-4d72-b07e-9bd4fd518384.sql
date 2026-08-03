-- job_id: fa68e5ac-794f-4d72-b07e-9bd4fd518384
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T14:17:09.956000+00:00
-- started: 2026-07-29T14:17:10.064000+00:00
-- ended: 2026-07-29T14:17:10.152000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
