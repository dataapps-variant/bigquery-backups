-- job_id: 1f553ecf-02bd-4722-81c6-4104389a989f
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-01T05:01:42.637000+00:00
-- started: 2026-08-01T05:01:42.755000+00:00
-- ended: 2026-08-01T05:01:42.881000+00:00


           SELECT DISTINCT order_id 
           FROM `variant-finance-data-project.Sticky_Data.missing_orders` 
           WHERE company = 'mindworksllc' AND order_id IS NOT NULL
