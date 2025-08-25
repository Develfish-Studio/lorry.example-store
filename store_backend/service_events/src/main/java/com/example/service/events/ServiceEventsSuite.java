package com.example.service.events;

import com.example.service.events.config.ServiceEventsConfig;
import studio.develfish.guppy.common.api.config.CommonBeanConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
        CommonBeanConfig.class,
})
@ComponentScan(basePackageClasses = ServiceEventsConfig.class)
public class ServiceEventsSuite {
}
