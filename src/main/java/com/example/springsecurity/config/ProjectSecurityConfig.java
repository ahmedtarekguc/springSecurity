package com.example.springsecurity.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import javax.sql.DataSource;

@Configuration
public class ProjectSecurityConfig {

    @Bean
    SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http)throws Exception{
        http.csrf((csrf) -> csrf.disable()).authorizeHttpRequests((requests) -> requests.requestMatchers("/myAccount","/myBalance","/myLoans","/myCards").authenticated()
                        .requestMatchers("/notices","/contact","/register").permitAll())
                .formLogin(Customizer.withDefaults())
                .httpBasic(Customizer.withDefaults());
//        Deny All requests
//        http.authorizeHttpRequests((requests) -> requests.anyRequest().denyAll())
//                .formLogin(Customizer.withDefaults())
//                .httpBasic(Customizer.withDefaults());
//        Accept All requests
//        http.authorizeHttpRequests(requests -> requests.anyRequest().permitAll())
//                .formLogin(Customizer.withDefaults())
//                .httpBasic(Customizer.withDefaults());
        return http.build();
    }
/*
    @Bean
    public InMemoryUserDetailsManager userDetailsManager(){
//        Using default password encoder
//        UserDetails admin = User.withDefaultPasswordEncoder().username("admin").password("1111").authorities("admin").build();
//        UserDetails user = User.withDefaultPasswordEncoder().username("user").password("1111").authorities("read").build();
//        return new InMemoryUserDetailsManager(admin,user);

//        using no password encoder
        UserDetails admin = User.withUsername("admin").username("admin").password("1111").authorities("admin").build();
        UserDetails user = User.withUsername("user").username("user").password("1111").authorities("read").build();
        return new InMemoryUserDetailsManager(admin,user);
    }
*/

//    @Bean
//    public UserDetailsService userDetailsService(DataSource dataSource){
//        return new JdbcUserDetailsManager(dataSource);
//    }

    @Bean
    public PasswordEncoder passwordEncoder(){
//        return NoOpPasswordEncoder.getInstance();
        return new BCryptPasswordEncoder();
    }
}
