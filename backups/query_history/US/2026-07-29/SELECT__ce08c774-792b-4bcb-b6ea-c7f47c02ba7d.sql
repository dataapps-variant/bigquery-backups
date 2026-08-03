-- job_id: ce08c774-792b-4bcb-b6ea-c7f47c02ba7d
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T10:04:18.376000+00:00
-- started: 2026-07-29T10:04:18.466000+00:00
-- ended: 2026-07-29T10:04:18.585000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
