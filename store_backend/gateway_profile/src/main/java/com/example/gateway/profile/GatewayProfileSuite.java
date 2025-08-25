package com.example.gateway.profile;

import com.example.gateway.profile.config.GatewayProfileConfig;
import studio.develfish.guppy.common.api.config.CommonBeanConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
        CommonBeanConfig.class,
})
@ComponentScan(basePackageClasses = GatewayProfileConfig.class)
public class GatewayProfileSuite {
}
