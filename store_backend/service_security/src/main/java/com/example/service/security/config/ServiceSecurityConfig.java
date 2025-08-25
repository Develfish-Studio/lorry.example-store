package com.example.service.security.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import(ServiceSecurityAppOpenidConfig.class)
public class ServiceSecurityConfig {
}
