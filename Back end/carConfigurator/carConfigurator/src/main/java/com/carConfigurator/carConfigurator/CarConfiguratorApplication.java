package com.carConfigurator.carConfigurator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.crypto.password.PasswordEncoder;

import api.UserController;
import api.UserService;
import jwt.JwtTokenUtil;
import configuration.WebSocketConfig;
import exception.APIExceptionHandler;
import model.JwtRequest;
import model.JwtResponse;
import api.DataAccessService;
import jwt.JwtAuthenticationEntryPoint;
import jwt.JwtAuthentificationController;
import jwt.JwtUserDetailsService;

@ComponentScan(basePackageClasses = UserController.class)
@ComponentScan(basePackageClasses = DataAccessService.class)
@ComponentScan(basePackageClasses = UserService.class)
@ComponentScan(basePackageClasses = APIExceptionHandler.class)
@ComponentScan(basePackageClasses = WebSocketConfig.class)
@ComponentScan(basePackageClasses = JwtAuthentificationController.class)
@ComponentScan(basePackageClasses = JwtAuthenticationEntryPoint.class)
@ComponentScan(basePackageClasses = JwtUserDetailsService.class)
@ComponentScan(basePackageClasses = JwtRequest.class)
@ComponentScan(basePackageClasses = JwtTokenUtil.class)
@ComponentScan(basePackageClasses = JwtRequest.class)
@ComponentScan(basePackageClasses = JwtResponse.class)

@SpringBootApplication
public class CarConfiguratorApplication {

	public static void main(String[] args) {

		SpringApplication.run(CarConfiguratorApplication.class, args);
	}

}
