package com.example.gateway.events;

import com.example.gateway.events.config.GatewayEventsConfig;
import studio.develfish.guppy.common.api.config.CommonBeanConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
        CommonBeanConfig.class,
})
@ComponentScan(basePackageClasses = GatewayEventsConfig.class)
public class GatewayEventsSuite {
}
