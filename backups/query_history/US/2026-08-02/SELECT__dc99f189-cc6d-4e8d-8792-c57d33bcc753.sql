-- job_id: dc99f189-cc6d-4e8d-8792-c57d33bcc753
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T22:01:21.212000+00:00
-- started: 2026-08-02T22:01:21.347000+00:00
-- ended: 2026-08-02T22:01:21.469000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
