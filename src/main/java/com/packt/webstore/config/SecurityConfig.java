/**
 *
 */
package com.packt.webstore.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.packt.webstore.domain.taikhoan;
import com.packt.webstore.service.taiKhoanService;

/**
 *
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	taiKhoanService service;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stub
		for (taikhoan tk : service.list()) {
			auth.inMemoryAuthentication().withUser(tk.getUser()).password(tk.getPass()).roles(tk.getRole());
		}
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		http.csrf().disable();
		http.formLogin().loginPage("/login").usernameParameter("username").passwordParameter("password")
				.defaultSuccessUrl("/shop/").failureUrl("/login?error");
		http.logout().logoutSuccessUrl("/login?logout");
		http.exceptionHandling().accessDeniedPage("/login?accessDenied");

		http.authorizeRequests().antMatchers("/", "/shop/**").permitAll().antMatchers("/admin/**").hasRole("ADMIN")
				.antMatchers("/giohang/**").hasAnyRole("ADMIN", "USER");
	}

}
