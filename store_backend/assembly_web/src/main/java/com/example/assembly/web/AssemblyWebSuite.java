package com.example.assembly.web;

import com.example.assembly.web.config.AssemblyWebConfig;
import studio.develfish.guppy.common.api.config.CommonBeanConfig;
import studio.develfish.guppy.common.events.config.CloudEventsBeanConfig;
import studio.develfish.guppy.common.events.config.CloudEventsKafkaConfig;
import studio.develfish.guppy.common.security.config.OpenidConfig;
import studio.develfish.guppy.common.web.config.OpenApiConfig;
import studio.develfish.guppy.common.web.config.OpenApiSecurityConfig;
import studio.develfish.guppy.common.web.config.WebMvcConfig;
import studio.develfish.guppy.common.web.config.WebMvcSecurityConfig;
import studio.develfish.guppy.common.ws.config.WebSocketConfig;
import studio.develfish.guppy.common.ws.config.WebSocketHubConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@Import({
        CommonBeanConfig.class,
        WebMvcConfig.class,
        WebMvcSecurityConfig.class,
        OpenApiConfig.class,
        OpenApiSecurityConfig.class,
        WebSocketConfig.class,
        WebSocketHubConfig.class,
        CloudEventsKafkaConfig.class,
        CloudEventsBeanConfig.class,
        OpenidConfig.class,
})
@ComponentScan(basePackageClasses = AssemblyWebConfig.class)
@EnableJpaRepositories
public class AssemblyWebSuite {
}
