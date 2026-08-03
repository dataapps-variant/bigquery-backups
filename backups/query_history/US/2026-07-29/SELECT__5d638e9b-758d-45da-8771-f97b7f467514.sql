-- job_id: 5d638e9b-758d-45da-8771-f97b7f467514
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T08:04:50.045000+00:00
-- started: 2026-07-29T08:04:50.137000+00:00
-- ended: 2026-07-29T08:04:50.239000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
