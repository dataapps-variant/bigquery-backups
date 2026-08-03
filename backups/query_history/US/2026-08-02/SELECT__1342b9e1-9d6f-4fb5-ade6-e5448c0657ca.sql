-- job_id: 1342b9e1-9d6f-4fb5-ade6-e5448c0657ca
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T01:04:17.733000+00:00
-- started: 2026-08-02T01:04:17.823000+00:00
-- ended: 2026-08-02T01:04:18.016000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
