-- job_id: b7aa9995-b968-48a3-9ec2-9f3bea09e376
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T06:01:31.706000+00:00
-- started: 2026-08-02T06:01:31.806000+00:00
-- ended: 2026-08-02T06:01:31.947000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
