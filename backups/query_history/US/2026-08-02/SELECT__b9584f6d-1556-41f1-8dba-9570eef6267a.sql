-- job_id: b9584f6d-1556-41f1-8dba-9570eef6267a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T12:08:40.962000+00:00
-- started: 2026-08-02T12:08:41.129000+00:00
-- ended: 2026-08-02T12:08:41.261000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
