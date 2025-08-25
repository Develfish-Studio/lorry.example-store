package com.example.gateway.payments;

import com.example.gateway.payments.config.GatewayPaymentsConfig;
import studio.develfish.guppy.common.api.config.CommonBeanConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
        CommonBeanConfig.class,
})
@ComponentScan(basePackageClasses = GatewayPaymentsConfig.class)
public class GatewayPaymentsSuite {
}
