-- job_id: 8a8f1947-42aa-4205-855e-bcab5439879e
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: DELETE
-- created: 2026-08-02T06:18:32.660000+00:00
-- started: 2026-08-02T06:18:33.044000+00:00
-- ended: 2026-08-02T06:18:34.071000+00:00


        DELETE FROM `variant-finance-data-project.Sticky_Data.missing_updated_orders`
        WHERE company = 'mindworksllc' AND order_id IN ('7304000', '7113569', '7304384', '7119136', '7134862', '7304447', '7303239', '7288636', '7288743', '7288391', '7285223', '7304311', '7304648', '7146950', '6964243', '7304793', '7304321', '7304529', '7301018', '6941672', '7296945', '7304536', '7304430', '7284694', '7304712', '7304753', '7304717')
