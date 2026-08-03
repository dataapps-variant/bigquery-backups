-- job_id: b656a8f9-6340-4f30-ba4f-8862b8da08ab
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T20:03:12.485000+00:00
-- started: 2026-08-02T20:03:12.616000+00:00
-- ended: 2026-08-02T20:03:12.724000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
