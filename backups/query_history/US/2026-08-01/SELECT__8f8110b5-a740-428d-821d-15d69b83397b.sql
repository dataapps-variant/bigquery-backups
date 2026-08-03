-- job_id: 8f8110b5-a740-428d-821d-15d69b83397b
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T16:08:25.045000+00:00
-- started: 2026-08-01T16:08:25.171000+00:00
-- ended: 2026-08-01T16:08:25.294000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
