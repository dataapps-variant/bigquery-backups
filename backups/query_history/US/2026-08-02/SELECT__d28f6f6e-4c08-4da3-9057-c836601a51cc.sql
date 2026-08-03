-- job_id: d28f6f6e-4c08-4da3-9057-c836601a51cc
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T16:05:53.816000+00:00
-- started: 2026-08-02T16:05:53.933000+00:00
-- ended: 2026-08-02T16:05:54.033000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
