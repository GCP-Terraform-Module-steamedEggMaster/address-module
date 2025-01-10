module "static_ip" {
  source = "../../"

  # 필수 변수
  name   = "test-static-ip"
  region = "asia-northeast3"

  # 선택적 변수
  address      = null
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
  ip_version   = "IPV4"

  # 연결 및 설명
  description   = "This is an example static IP for a production environment"
  subnetwork    = null
  network       = null
  prefix_length = null

  # IPv6 관련 설정
  ipv6_endpoint_type = null

  # 메타데이터 및 라벨
  labels = {
    environment = "production"
    team        = "devops"
  }

  # Timeout 설정
  timeout_create = "30m"
  timeout_update = "20m"
  timeout_delete = "20m"
}