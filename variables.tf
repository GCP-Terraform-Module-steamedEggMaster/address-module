variable "name" {
  description = "IP 주소의 이름"
  type        = string
}

variable "address_type" {
  description = "IP 주소 유형 (EXTERNAL 또는 INTERNAL)"
  type        = string
  default     = "EXTERNAL"
}

variable "region" {
  description = "IP 주소를 생성할 GCP 지역"
  type        = string
}

variable "network_tier" {
  description = "네트워크 계층 (PREMIUM 또는 STANDARD)"
  type        = string
  default     = "PREMIUM"
}

variable "ip_version" {
  description = "IP 버전 (IPV4 또는 IPV6)"
  type        = string
  default     = "IPV4"
}

variable "stack_type" {
  description = "스택 유형 (IPV4_ONLY 또는 IPV4_IPV6)"
  type        = string
  default     = null
}

variable "subnetwork" {
  description = "연결할 서브네트워크 이름 (선택 사항)"
  type        = string
  default     = null
}

variable "network" {
  description = "VPC 네트워크 ID (선택 사항)"
  type        = string
  default     = null
}

variable "prefix_length" {
  description = "서브넷 프리픽스 길이 (INTERNAL IP 전용)"
  type        = number
  default     = null
}

variable "description" {
  description = "IP 주소 리소스 설명"
  type        = string
  default     = null
}

variable "purpose" {
  description = "IP 주소의 사용 목적 (GCE_ENDPOINT, DNS_RESOLVER, VPC_PEERING 등)"
  type        = string
  default     = null
}

variable "address" {
  description = "고정 IP 주소를 수동으로 지정 (선택 사항)"
  type        = string
  default     = null
}

variable "project" {
  description = "GCP 프로젝트 ID"
  type        = string
  default     = null
}