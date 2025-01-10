resource "google_compute_address" "ip" {
  # 필수 옵션
  name = var.name # 리소스 이름 (RFC1035 규칙 준수)

  # 네트워크 및 주소 관련 옵션
  address      = var.address      # 고정 IP 주소 수동 지정
  address_type = var.address_type # 주소 유형 (INTERNAL/EXTERNAL)
  network_tier = var.network_tier # 네트워크 계층 (PREMIUM/STANDARD)
  ip_version   = var.ip_version   # IP 버전 (IPV4/IPV6)

  # 연결 및 범위 설정
  subnetwork    = var.subnetwork    # 서브네트워크 URL (INTERNAL 주소 전용)
  network       = var.network       # VPC 네트워크 URL (INTERNAL 주소 전용)
  prefix_length = var.prefix_length # IP 범위 프리픽스 길이

  # 설명 및 목적
  description = var.description # 리소스 설명
  purpose     = var.purpose     # 리소스 목적 (GCE_ENDPOINT, VPC_PEERING 등)

  # IPv6 전용 옵션
  ipv6_endpoint_type = var.ipv6_endpoint_type # IPv6 주소 엔드포인트 유형 (VM/NETLB)

  # 메타데이터 및 기타 옵션
  labels  = var.labels  # 라벨 (Key-Value Pair)
  region  = var.region  # 리소스 생성 지역
  project = var.project # GCP 프로젝트 ID

  # Timeout 설정 (변수로 설정)
  timeouts {
    create = var.timeout_create # 리소스 생성 제한 시간
    update = var.timeout_update # 리소스 업데이트 제한 시간
    delete = var.timeout_delete # 리소스 삭제 제한 시간
  }
}