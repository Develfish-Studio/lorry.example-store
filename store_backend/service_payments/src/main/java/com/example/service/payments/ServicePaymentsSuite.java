package com.example.service.payments;

import com.example.service.payments.config.ServicePaymentsConfig;
import studio.develfish.guppy.common.api.config.CommonBeanConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
        CommonBeanConfig.class,
})
@ComponentScan(basePackageClasses = ServicePaymentsConfig.class)
public class ServicePaymentsSuite {
}
