-- job_id: 296888d9-56b6-4288-a44f-1c558ac15a8c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T16:03:19.625000+00:00
-- started: 2026-08-02T16:03:19.810000+00:00
-- ended: 2026-08-02T16:03:19.916000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
