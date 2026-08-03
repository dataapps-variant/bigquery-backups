-- job_id: b1029886-aee2-4b89-914a-8e0b54349232
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T03:01:49.139000+00:00
-- started: 2026-08-02T03:01:49.273000+00:00
-- ended: 2026-08-02T03:01:49.390000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'formsourcellc' AND order_id IS NOT NULL
