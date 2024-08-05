data "azurerm_billing_mca_account_scope" "billing-details" {
  billing_account_name = "a5b7182a-e4c2-53c4-2825-d49aafc68421:1c7ff077-588c-4d51-adfb-b2ac7f61188b_2019-05-31"
  billing_profile_name = "ZCI5-4ZAW-BG7-PGB"
  invoice_section_name = "UCXY-NSPY-PJA-PGB"
}

resource "azurerm_subscription" "driving-school-app-subscription" {
  subscription_name = "Driving School App Subscription"
  billing_scope_id  = data.azurerm_billing_mca_account_scope.billing-details.id
}
