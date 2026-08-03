-- job_id: 402895aa-99c8-4bde-bd1e-fcfd18800fc4
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T13:11:10.826000+00:00
-- started: 2026-08-01T13:11:10.963000+00:00
-- ended: 2026-08-01T13:11:11.071000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'jobflowllc' AND order_id IS NOT NULL
