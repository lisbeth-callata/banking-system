package com.bank.banking_system.config;


import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    @Bean
    public Info apiInfo() {
        return new Info()
                .title("Bank API")
                .description("API para gestionar clientes y cuentas bancarias")
                .version("1.0")
                .contact(new io.swagger.v3.oas.models.info.Contact().name("Banco XYZ").email("contact@banco.xyz"));
    }
}
