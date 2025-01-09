# address-module
GCP Terraform address module Repo

Google Cloud Platform(GCP)에서 고정 IP 주소를 생성하고 관리하기 위한 Terraform 모듈입니다.  <br>
이 모듈은 VPC 네트워크 및 서브네트워크와 연동하여 IP 주소를 손쉽게 설정할 수 있도록 설계되었습니다.

<br>

## 📑 **목차**
1. [모듈 특징](#모듈-특징)
2. [사용 방법](#사용-방법)
    1. [사전 준비](#1-사전-준비)
    2. [입력 변수](#2-입력-변수)
    3. [모듈 호출 예시](#3-모듈-호출-예시)
    4. [출력값 (Outputs)](#4-출력값-outputs)
    5. [지원 버전](#5-지원-버전)
    6. [모듈 개발 및 관리](#6-모듈-개발-및-관리)
3. [테스트](#terratest를-이용한-테스트)
4. [주요 버전 관리](#주요-버전-관리)
5. [기여](#기여-contributing)
6. [라이선스](#라이선스-license)

---

## 모듈 특징

- **사용자 정의 고정 IP 주소 생성**: IPv4 및 IPv6 지원.
- **VPC 및 서브네트워크 연동**: VPC 네트워크 또는 서브네트워크 URL 연결.
- **다양한 네트워크 설정 옵션**:
  - 네트워크 계층: `PREMIUM` 또는 `STANDARD`
  - IP 주소 유형: `EXTERNAL` 또는 `INTERNAL`
- **IPv6 전용 옵션**: IPv6 엔드포인트 유형 구성 지원.
- **라벨 및 설명 지원**: 리소스 식별을 위한 라벨 추가 가능.
- **시간 초과 설정 지원**: 리소스 생성, 업데이트, 삭제 시 제한 시간 설정.


---

## 사용 방법

### 1. 사전 준비

다음 사항을 확인하세요:
1. Google Cloud 프로젝트 준비.
2. 적절한 IAM 권한 필요: `roles/compute.networkAdmin` (IP 주소 관리 권한 필수).

<br>

### 2. 입력 변수

#### 필수 옵션
| 변수명     | 타입   | 필수 여부 | 기본값 | 설명                              |
|------------|--------|-----------|--------|-----------------------------------|
| `name`     | string | ✅        | 없음   | IP 주소의 이름 (RFC1035 규칙 준수) |

<br>

#### 네트워크 및 주소 관련 옵션
| 변수명           | 타입       | 필수 여부 | 기본값      | 설명                                     |
|------------------|------------|-----------|-------------|------------------------------------------|
| `address`        | string     | ❌        | `null`        | 고정 IP 주소 수동 지정 (선택 사항)        |
| `address_type`   | string     | ❌        | `EXTERNAL`  | IP 주소 유형 (EXTERNAL 또는 INTERNAL)     |
| `network_tier`   | string     | ❌        | `PREMIUM`   | 네트워크 계층 (PREMIUM 또는 STANDARD)     |
| `ip_version`     | string     | ❌        | `IPV4`      | IP 버전 (IPV4 또는 IPV6)                  |
| `subnetwork`     | string     | ❌        | `null`        | 연결할 서브네트워크 URL (선택 사항)       |
| `network`        | string     | ❌        | `null`        | 연결할 VPC 네트워크 URL                   |
| `prefix_length`  | number     | ❌        | `null`        | IP 범위 프리픽스 길이                     |

<br>

#### 설명 및 목적
| 변수명           | 타입       | 필수 여부 | 기본값 | 설명                                     |
|------------------|------------|-----------|--------|------------------------------------------|
| `description`    | string     | ❌        | `null`   | 리소스 설명                              |
| `purpose`        | string     | ❌        | `null`   | IP 주소의 사용 목적 (예: GCE_ENDPOINT)    |

<br>

#### IPv6 관련 옵션
| 변수명              | 타입       | 필수 여부 | 기본값 | 설명                                     |
|---------------------|------------|-----------|--------|------------------------------------------|
| `ipv6_endpoint_type`| string     | ❌        | `null`   | IPv6 엔드포인트 유형 (VM 또는 NETLB)      |

<br>

#### 메타데이터 및 기타 옵션
| 변수명           | 타입        | 필수 여부 | 기본값 | 설명                                                             |
|------------------|-------------|-----------|--------|----------------------------------------------------------|
| `labels`         | map(string) | ❌        | `{}`   | 리소스에 적용할 라벨 (Key-Value Pair)                         |
| `region`         | string      | ❌        | `null`   | IP 주소를 생성할 GCP 지역 - 미설정 시, Provider Region 정보 사용  |
| `project`        | string      | ❌        | `null`   | GCP 프로젝트 ID - 미설정 시, Provider Region 정보 사용          |

<br>

#### Timeout 설정
| 변수명           | 타입   | 필수 여부 | 기본값 | 설명                          |
|------------------|--------|-----------|--------|-------------------------------|
| `timeout_create` | string | ❌        | `20m`  | 리소스 생성 제한 시간           |
| `timeout_update` | string | ❌        | `20m`  | 리소스 업데이트 제한 시간       |
| `timeout_delete` | string | ❌        | `20m`  | 리소스 삭제 제한 시간           |

<br>

### 3. 모듈 호출 예시

```hcl
module "fixed_ip_address" {
  source = "git::https://github.com/GCP-Terraform-Module-steamedEggMaster/address-module.git?ref=v1.0.0"

  name               = "custom-ip-address"
  address_type       = "INTERNAL"
  network_tier       = "STANDARD"
  region             = "asia-northeast3"
  network            = "projects/my-project/global/networks/my-vpc"
  subnetwork         = "projects/my-project/regions/asia-northeast3/subnetworks/my-subnet"
  labels             = { "env" = "production", "team" = "network" }
  timeout_create     = "15m"
}
```

<br>

### 4. 출력값 (Outputs)

| 출력명                      | 설명                                    |
|---------------------------|----------------------------------------|    
| `id`                      | 생성된 리소스의 고유 식별자                   |
| `address_name`            | 생성된 IP 주소의 이름                       |
| `address`                 | 생성된 IP 주소                             |
| `address_type`            | IP 주소 유형 (EXTERNAL 또는 INTERNAL)      |
| `self_link`               | 생성된 리소스의 고유 URI                    |
| `creation_timestamp`      | 리소스 생성 날짜와 시간 (RFC3339 형식)        |
| `users`                   | 이 IP 주소를 사용하는 리소스들의 URL 목록       |
| `region`                  | IP 주소가 생성된 GCP 지역                   |
| `network`                 | 연결된 VPC 네트워크                         |
| `subnetwork`              | 연결된 서브네트워크                          |

<br>

### 5. 지원 버전

#### a.  Terraform 버전
| 버전 범위 | 설명                              |
|-----------|-----------------------------------|
| `1.10.3`   | 최신 버전, 지원 및 테스트 완료                  |

#### b. Google Provider 버전
| 버전 범위 | 설명                              |
|-----------|-----------------------------------|
| `~> 4.0`  | 최소 지원 버전                   |

<br>

### 6. 모듈 개발 및 관리

- **저장소 구조**:
  ```
  router-module/
    ├── .github/workflows/  # github actions 자동화 테스트
    ├── examples/           # 테스트를 위한 루트 모듈 모음 디렉터리
    ├── test/               # 테스트 구성 디렉터리
    ├── main.tf             # 모듈의 핵심 구현
    ├── variables.tf        # 입력 변수 정의
    ├── outputs.tf          # 출력 정의
    ├── README.md           # 문서화 파일
  ```

<br>

---

### Terratest를 이용한 테스트
이 모듈을 테스트하려면 제공된 Go 기반 테스트 프레임워크를 사용하세요. 아래를 확인하세요:

1. Terraform 및 Go 설치.
2. 필요한 환경 변수 설정.
3. 테스트 실행:
```bash
go test -v ./test
```

<br>

## 주요 버전 관리
이 모듈은 [Semantic Versioning](https://semver.org/)을 따릅니다.  
안정된 버전을 사용하려면 `?ref=<version>`을 활용하세요:

```hcl
source = "git::https://github.com/GCP-Terraform-Module-steamedEggMaster/address-module.git?ref=v1.0.0"
```

### Module ref 버전
| Major | Minor | Patch |
|-----------|-----------|----------|
| `1.0.0`   |    |   |

<br>

## 기여 (Contributing)
기여를 환영합니다! 버그 제보 및 기능 요청은 GitHub Issues를 통해 제출해주세요.

<br>

## 라이선스 (License)
[MIT License](LICENSE)