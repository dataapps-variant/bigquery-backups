-- job_id: 464d8ca8-eec9-49a1-bbbd-6c37b251f01d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T04:02:45.422000+00:00
-- started: 2026-08-01T04:02:45.532000+00:00
-- ended: 2026-08-01T04:02:45.661000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
