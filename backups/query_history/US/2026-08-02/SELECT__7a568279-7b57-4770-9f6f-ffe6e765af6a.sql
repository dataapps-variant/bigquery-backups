-- job_id: 7a568279-7b57-4770-9f6f-ffe6e765af6a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T18:02:01.865000+00:00
-- started: 2026-08-02T18:02:02.007000+00:00
-- ended: 2026-08-02T18:02:02.125000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
