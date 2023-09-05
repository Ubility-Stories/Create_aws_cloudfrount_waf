resource "aws_wafv2_web_acl" "atp-example" {
  name  = var.waf-name
  scope = var.scope
  default_action {
    allow {}
  }
  rule {
    name     = var.rule1
    priority = var.priority1

    override_action {
      count {}
    }

    statement {
      managed_rule_group_statement {
        name        = var.managed-group-rule1
        vendor_name = "AWS"



      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "friendly-rule-metric-name"
      sampled_requests_enabled   = false
    }
  }


rule {
  name     = var.rule2
  priority = var.priority2

  override_action {
    count {}
  }

  statement {
    managed_rule_group_statement {
      name        = var.managed-group-rule2
      vendor_name = "AWS"
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "friendly-rule-metric-name"
    sampled_requests_enabled   = false
  }
}

visibility_config {
  cloudwatch_metrics_enabled = false
  metric_name                = "friendly-metric-name"
  sampled_requests_enabled   = false
}
}


resource "aws_cloudfront_distribution" "example_distribution" {
  enabled = true
  origin {
    domain_name = var.domain-name
    origin_id   = var.origion-id

    custom_origin_config {

      http_port                = 80
      https_port               = 443
      origin_protocol_policy   = "https-only"
      origin_ssl_protocols     = ["TLSv1.2"]
      origin_read_timeout      = 30
      origin_keepalive_timeout = 5
    }
  }
  default_cache_behavior {
    target_origin_id       = var.origion-id
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  }
  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["US", "CA", "GB", "DE"]
    }
  }

  # More settings can be added here
  viewer_certificate {
    cloudfront_default_certificate = true
  }

  price_class = var.price-class

  web_acl_id = aws_wafv2_web_acl.atp-example.arn
}
