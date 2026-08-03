-- job_id: 42fba602-f0a1-47dc-8677-9b23b7d16d3e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T08:03:37.510000+00:00
-- started: 2026-08-02T08:03:37.613000+00:00
-- ended: 2026-08-02T08:03:37.725000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
