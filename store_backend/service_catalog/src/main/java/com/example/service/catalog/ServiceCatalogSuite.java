package com.example.service.catalog;

import com.example.service.catalog.config.ServiceCatalogConfig;
import studio.develfish.guppy.common.api.config.CommonBeanConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
        CommonBeanConfig.class,
})
@ComponentScan(basePackageClasses = ServiceCatalogConfig.class)
public class ServiceCatalogSuite {
}
