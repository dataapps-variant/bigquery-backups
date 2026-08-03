-- job_id: 3bcb7361-48ad-4e26-a22d-9d8c4d61c83e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T03:04:17.774000+00:00
-- started: 2026-08-02T03:04:17.895000+00:00
-- ended: 2026-08-02T03:04:18.018000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'pdfdotnet' AND order_id IS NOT NULL
