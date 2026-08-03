-- job_id: 651c6077-a368-4e75-b735-753fa5f69d62
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T16:05:01.064000+00:00
-- started: 2026-08-02T16:05:01.168000+00:00
-- ended: 2026-08-02T16:05:01.288000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
