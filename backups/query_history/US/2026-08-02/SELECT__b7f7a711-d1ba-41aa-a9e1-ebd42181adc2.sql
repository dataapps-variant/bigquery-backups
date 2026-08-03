-- job_id: b7f7a711-d1ba-41aa-a9e1-ebd42181adc2
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T13:07:20.857000+00:00
-- started: 2026-08-02T13:07:20.964000+00:00
-- ended: 2026-08-02T13:07:21.078000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
