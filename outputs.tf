output "address_name" {
  description = "생성된 IP 주소의 이름"
  value       = google_compute_address.address.name
}

output "address" {
  description = "생성된 IP 주소"
  value       = google_compute_address.address.address
}

output "self_link" {
  description = "생성된 IP 주소의 self_link"
  value       = google_compute_address.address.self_link
}

output "region" {
  description = "IP 주소가 생성된 GCP 지역"
  value       = google_compute_address.address.region
}

output "address_type" {
  description = "IP 주소 유형 (EXTERNAL 또는 INTERNAL)"
  value       = google_compute_address.address.address_type
}

output "subnetwork" {
  description = "연결된 서브네트워크 (존재하는 경우)"
  value       = google_compute_address.address.subnetwork
}

output "network" {
  description = "연결된 VPC 네트워크 (존재하는 경우)"
  value       = google_compute_address.address.network
}