-- job_id: 3b44b284-de94-434d-a1c5-14c49aac3fad
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-27T20:03:56.303000+00:00
-- started: 2026-07-27T20:03:56.385000+00:00
-- ended: 2026-07-27T20:03:56.519000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
