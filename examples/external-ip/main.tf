module "external_ip" {
  source          = "../../"

  name            = "test-external-ip"
  address_type    = "EXTERNAL"
  region          = "asia-northeast3"
  network_tier    = "PREMIUM"
  ip_version      = "IPV4"
  description     = "Static external IP for production"
  labels          = { environment = "production" }
}