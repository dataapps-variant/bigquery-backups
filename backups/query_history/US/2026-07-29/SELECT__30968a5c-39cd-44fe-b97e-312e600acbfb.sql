-- job_id: 30968a5c-39cd-44fe-b97e-312e600acbfb
-- user: breakout-room-calibrator-sa@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-07-29T12:30:05.705000+00:00
-- started: 2026-07-29T12:30:05.836000+00:00
-- ended: 2026-07-29T12:30:06.210000+00:00


SELECT max(validation_run_timestamp) AS validation_run_timestamp, missing_in_table, field_name_in_missing_table, available_in_table, field_name_in_available_table, string_agg(missing_value, ", ") AS missing_values
FROM (
SELECT * FROM `variant-finance-data-project.Verifications.Verification_1-10` WHERE missing_value != ''
UNION ALL
SELECT * FROM `variant-finance-data-project.Verifications.Verification_11-20` WHERE missing_value != ''
UNION ALL
SELECT * FROM `variant-finance-data-project.Verifications.Verification_21-30` WHERE missing_value != ''
UNION ALL
SELECT * FROM `variant-finance-data-project.Verifications.Verification_31-40` WHERE missing_value != ''
UNION ALL
SELECT * FROM `variant-finance-data-project.Verifications.Verification_41-50` WHERE missing_value != ''
UNION ALL
SELECT * FROM `variant-finance-data-project.Verifications.Verification_41-52` WHERE missing_value != '') AS d
GROUP BY missing_in_table, field_name_in_missing_table, available_in_table, field_name_in_available_table
