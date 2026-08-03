-- job_id: 60e5f033-655d-40de-9606-21ee1c5740da
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T05:01:44.939000+00:00
-- started: 2026-08-02T05:01:45.069000+00:00
-- ended: 2026-08-02T05:01:45.204000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
