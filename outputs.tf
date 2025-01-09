output "id" {
  description = "리소스의 고유 식별자"
  value       = google_compute_address.address.id
}

output "address_name" {
  description = "생성된 IP 주소의 이름"
  value       = google_compute_address.address.name
}

output "address" {
  description = "생성된 IP 주소"
  value       = google_compute_address.address.address
}

output "address_type" {
  description = "IP 주소 유형 (EXTERNAL 또는 INTERNAL)"
  value       = google_compute_address.address.address_type
}

output "self_link" {
  description = "생성된 리소스의 고유 URI"
  value       = google_compute_address.address.self_link
}

output "creation_timestamp" {
  description = "리소스 생성 날짜와 시간 (RFC3339 형식)"
  value       = google_compute_address.address.creation_timestamp
}

output "users" {
  description = "이 IP 주소를 사용하는 리소스들의 URL 목록"
  value       = google_compute_address.address.users
}

output "region" {
  description = "IP 주소가 생성된 GCP 지역"
  value       = google_compute_address.address.region
}

output "network" {
  description = "연결된 VPC 네트워크 (존재하는 경우)"
  value       = google_compute_address.address.network
}

output "subnetwork" {
  description = "연결된 서브네트워크 (존재하는 경우)"
  value       = google_compute_address.address.subnetwork
}