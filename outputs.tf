output "api_invoke_url" {
  value = aws_api_gateway_stage.prod.invoke_url
}

output "cloudfront_domain" {
  value = aws_cloudfront_distribution.frontend.domain_name
}
