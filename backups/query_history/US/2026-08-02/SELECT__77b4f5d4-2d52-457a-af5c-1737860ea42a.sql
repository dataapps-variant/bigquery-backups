-- job_id: 77b4f5d4-2d52-457a-af5c-1737860ea42a
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T10:06:29.612000+00:00
-- started: 2026-08-02T10:06:29.738000+00:00
-- ended: 2026-08-02T10:06:29.854000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
