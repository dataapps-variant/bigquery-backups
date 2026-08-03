-- job_id: 039b133c-e656-44fd-aad5-31ab23c6bc86
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T16:11:04.979000+00:00
-- started: 2026-08-01T16:11:05.125000+00:00
-- ended: 2026-08-01T16:11:05.261000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
