package com.example.service.uploads;

import com.example.service.uploads.config.ServiceUploadsConfig;
import studio.develfish.guppy.common.api.config.CommonBeanConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
        CommonBeanConfig.class,
})
@ComponentScan(basePackageClasses = ServiceUploadsConfig.class)
public class ServiceUploadsSuite {
}
