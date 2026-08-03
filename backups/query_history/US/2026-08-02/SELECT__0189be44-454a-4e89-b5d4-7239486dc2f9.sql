-- job_id: 0189be44-454a-4e89-b5d4-7239486dc2f9
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T09:03:21.223000+00:00
-- started: 2026-08-02T09:03:21.329000+00:00
-- ended: 2026-08-02T09:03:21.474000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
