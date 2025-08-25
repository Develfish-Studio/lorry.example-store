package com.example.service.profile;

import com.example.service.profile.config.ServiceProfileConfig;
import studio.develfish.guppy.common.api.config.CommonBeanConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
        CommonBeanConfig.class,
})
@ComponentScan(basePackageClasses = ServiceProfileConfig.class)
public class ServiceProfileSuite {
}
