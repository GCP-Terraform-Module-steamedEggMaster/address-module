# 필수 변수
variable "name" {
  description = "IP 주소의 이름 (RFC1035 규칙 준수)"
  type        = string
}

# 선택적 변수
variable "address" {
  description = "고정 IP 주소를 수동으로 지정 (선택 사항)"
  type        = string
  default     = null
}

variable "address_type" {
  description = "IP 주소 유형 (EXTERNAL 또는 INTERNAL)"
  type        = string
  default     = "EXTERNAL"
}

variable "description" {
  description = "리소스 설명"
  type        = string
  default     = null
}

variable "purpose" {
  description = "IP 주소의 사용 목적 (GCE_ENDPOINT, VPC_PEERING 등)"
  type        = string
  default     = null
}

variable "network_tier" {
  description = "네트워크 계층 (PREMIUM 또는 STANDARD)"
  type        = string
  default     = "PREMIUM"
}

variable "subnetwork" {
  description = "연결할 서브네트워크 URL (선택 사항)"
  type        = string
  default     = null
}

variable "labels" {
  description = "리소스에 적용할 라벨 (Key-Value Pair)"
  type        = map(string)
  default     = {}
}

variable "network" {
  description = "VPC 네트워크 URL (선택 사항)"
  type        = string
  default     = null
}

variable "prefix_length" {
  description = "IP 범위 프리픽스 길이 (INTERNAL 주소 전용)"
  type        = number
  default     = null
}

variable "ip_version" {
  description = "IP 버전 (IPV4 또는 IPV6)"
  type        = string
  default     = "IPV4"
}

variable "ipv6_endpoint_type" {
  description = "IPv6 주소 엔드포인트 유형 (VM 또는 NETLB)"
  type        = string
  default     = null
}

variable "region" {
  description = "IP 주소를 생성할 GCP 지역"
  type        = string
  default     = null
}

variable "project" {
  description = "GCP 프로젝트 ID"
  type        = string
  default     = null
}

# Timeout 관련 변수
variable "timeout_create" {
  description = "리소스 생성 제한 시간"
  type        = string
  default     = "20m"  # 기본값: 20분
}

variable "timeout_update" {
  description = "리소스 업데이트 제한 시간"
  type        = string
  default     = "20m"  # 기본값: 20분
}

variable "timeout_delete" {
  description = "리소스 삭제 제한 시간"
  type        = string
  default     = "20m"  # 기본값: 20분
}