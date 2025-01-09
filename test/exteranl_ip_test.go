package test

import (
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestAddressModuleExternalIp(t *testing.T) {
	// Terraform 옵션 설정
	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/external-ip", // Terraform 루트 모듈 경로
	}

	// Terraform Init 및 Apply 실행
	defer terraform.Destroy(t, terraformOptions) // 테스트 종료 후 리소스 정리
	terraform.InitAndApply(t, terraformOptions)

	// ip_id 출력값 확인
	ipID := terraform.Output(t, terraformOptions, "ip_id")
	assert.NotEmpty(t, ipId, "Ip ID should not be empty")

	// ip_address 출력값 확인
	ipAddress := terraform.Output(t, terraformOptions, "ip_address")
	assert.NotEmpty(t, ipAddress, "Ip Address should not be empty")

	// ip_self_link 출력값 확인
	ipSelfLink := terraform.Output(t, terraformOptions, "ip_self_link")
	assert.NotEmpty(t, ipSelfLink, "Ip Self Link should not be empty")
}
