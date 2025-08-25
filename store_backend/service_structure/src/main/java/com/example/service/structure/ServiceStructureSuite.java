package com.example.service.structure;

import com.example.service.structure.config.ServiceStructureConfig;
import studio.develfish.guppy.common.api.config.CommonBeanConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
        CommonBeanConfig.class,
})
@ComponentScan(basePackageClasses = ServiceStructureConfig.class)
public class ServiceStructureSuite {
}
