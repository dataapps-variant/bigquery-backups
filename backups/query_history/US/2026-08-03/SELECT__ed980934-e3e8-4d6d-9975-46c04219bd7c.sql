-- job_id: ed980934-e3e8-4d6d-9975-46c04219bd7c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:02:19.422000+00:00
-- started: 2026-08-03T09:02:19.531000+00:00
-- ended: 2026-08-03T09:02:19.629000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
