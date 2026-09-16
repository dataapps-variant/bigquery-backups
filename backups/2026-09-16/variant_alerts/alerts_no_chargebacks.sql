CREATE OR REPLACE VIEW `variant-finance-data-project.variant_alerts.alerts_no_chargebacks` AS
SELECT *
FROM `variant-finance-data-project.variant_alerts.alerts`
WHERE metric != 'T7D Chargebacks';
