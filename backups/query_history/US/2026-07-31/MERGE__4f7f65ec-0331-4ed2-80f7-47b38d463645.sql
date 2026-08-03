-- job_id: 4f7f65ec-0331-4ed2-80f7-47b38d463645
-- user: sticky-maintainer@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: MERGE
-- created: 2026-07-31T11:05:43.487000+00:00
-- started: 2026-07-31T11:05:43.920000+00:00
-- ended: 2026-07-31T11:05:45.296000+00:00


MERGE `variant-finance-data-project.Sticky_Data.missing_updated_orders` AS target
USING (
  WITH
  sticky_data AS (
    SELECT order_id, last_modified
    FROM (
      SELECT order_id, last_modified,
        ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY last_modified DESC) AS rn
      FROM `variant-finance-data-project.Sticky_Data.Sticky_data_API_updated_FS`
    )
    WHERE rn = 1
  ),
  updates_orders AS (
    SELECT order_id, last_modified
    FROM `variant-finance-data-project.Sticky_Data.Updates_orders_FS`
  ),
  case_a_missing AS (
    SELECT
      u.order_id,
      'Missing in Sticky_data_API_updated' AS remark,
      u.last_modified
    FROM updates_orders u
    LEFT JOIN sticky_data s ON u.order_id = s.order_id
    WHERE s.order_id IS NULL
  ),
  case_b_not_updated AS (
    SELECT
      u.order_id,
      'Not updated - last_modified mismatch' AS remark,
      u.last_modified
    FROM updates_orders u
    INNER JOIN sticky_data s ON u.order_id = s.order_id
    WHERE u.last_modified != s.last_modified
  )

  SELECT order_id, remark, 'formsourcellc' AS company, last_modified
  FROM case_a_missing
  UNION ALL
  SELECT order_id, remark, 'formsourcellc' AS company, last_modified
  FROM case_b_not_updated
) AS source

ON target.order_id = source.order_id
WHEN MATCHED AND target.remark != source.remark THEN
  UPDATE SET
    target.remark = source.remark,
    target.company = source.company,
    target.last_modified = source.last_modified
WHEN NOT MATCHED THEN
  INSERT (order_id, remark, company, last_modified)
  VALUES (source.order_id, source.remark, source.company, source.last_modified)
