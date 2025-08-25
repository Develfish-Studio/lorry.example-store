package com.example.shared.api;

import com.example.shared.api.config.SharedApiConfig;
import studio.develfish.guppy.common.api.config.CommonBeanConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
        CommonBeanConfig.class,
})
@ComponentScan(basePackageClasses = SharedApiConfig.class)
public class SharedApiSuite {
}
