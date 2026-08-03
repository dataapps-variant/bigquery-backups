-- job_id: 46a5ed7d-0395-4b01-8ca5-4209bca44513
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T01:01:22.728000+00:00
-- started: 2026-08-02T01:01:23.128000+00:00
-- ended: 2026-08-02T01:01:24.132000+00:00


            DELETE FROM `variant-finance-data-project.Sticky_Data.missing_orders`
            WHERE company = 'mindworksllc' AND order_id IN ('4845038')
