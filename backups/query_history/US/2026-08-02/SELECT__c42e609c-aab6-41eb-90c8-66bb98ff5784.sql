-- job_id: c42e609c-aab6-41eb-90c8-66bb98ff5784
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T19:03:24.407000+00:00
-- started: 2026-08-02T19:03:24.510000+00:00
-- ended: 2026-08-02T19:03:24.690000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
