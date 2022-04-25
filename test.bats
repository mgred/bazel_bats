setup() {
  load 'external/bats-support/load'
  load 'external/bats-assert/load'
}

@test "can run" {
  run script.sh
  assert_output "Hello, World"
}
