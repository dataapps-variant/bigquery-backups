-- job_id: eba0e27d-47b4-4c0c-9d74-530a32b32c44
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T17:03:59.237000+00:00
-- started: 2026-08-02T17:03:59.375000+00:00
-- ended: 2026-08-02T17:03:59.501000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
