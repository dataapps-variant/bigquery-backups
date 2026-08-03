-- job_id: 187891ab-e8cd-4625-bae0-f5b8ca226453
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-02T22:01:33.320000+00:00
-- started: 2026-08-02T22:01:33.393000+00:00
-- ended: 2026-08-02T22:01:33.504000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
