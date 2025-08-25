package com.example.service.security;

import com.example.service.security.config.ServiceSecurityConfig;
import studio.develfish.guppy.common.api.config.CommonBeanConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
        CommonBeanConfig.class,
})
@ComponentScan(basePackageClasses = ServiceSecurityConfig.class)
public class ServiceSecuritySuite {
}
