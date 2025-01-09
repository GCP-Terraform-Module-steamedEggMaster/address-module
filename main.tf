resource "google_compute_address" "address" {
  # 필수 옵션
  name         = var.name         # IP 주소 이름
  address_type = var.address_type # IP 주소 유형 (EXTERNAL/INTERNAL)
  region       = var.region       # IP 주소를 생성할 GCP 지역

  # 선택적 옵션

  ### 네트워크 관련 옵션
  network_tier = var.network_tier # 네트워크 계층 (PREMIUM/STANDARD)
  ip_version   = var.ip_version   # IP 버전 (IPV4/IPV6)
  stack_type   = var.stack_type   # 스택 유형 (IPV4_ONLY/IPV4_IPV6)

  ### 연결 관련 옵션
  subnetwork = var.subnetwork # 연결할 서브네트워크 이름
  network    = var.network    # VPC 네트워크 ID

  ### 내부 IP 전용 옵션
  prefix_length = var.prefix_length # 서브넷 프리픽스 길이 (INTERNAL IP 전용)

  ### 리소스 설명 및 목적
  description = var.description # 리소스 설명
  purpose     = var.purpose     # IP의 사용 목적 (GCE_ENDPOINT/DNS_RESOLVER/VPC_PEERING)

  ### 기타
  address = var.address # 고정 IP 주소를 수동으로 지정
  project = var.project # GCP 프로젝트 ID
}