module "external_ip" {
  source = "../../" # 모듈 경로

  name         = "test-external-ip" # IP 주소 이름
  region       = "asia-northeast3"  # GCP 지역
  address_type = "EXTERNAL"         # IP 주소 유형
}