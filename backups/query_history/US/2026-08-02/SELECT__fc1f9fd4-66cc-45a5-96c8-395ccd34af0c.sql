-- job_id: fc1f9fd4-66cc-45a5-96c8-395ccd34af0c
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T16:03:25.694000+00:00
-- started: 2026-08-02T16:03:25.795000+00:00
-- ended: 2026-08-02T16:03:25.970000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
