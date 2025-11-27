package tn.essat.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import tn.essat.services.UserService;

@Configuration // bech tabda loula texecuta
@EnableWebSecurity
public class SecConfig extends WebSecurityConfigurerAdapter {// contient 2 methodes et un bean

	@Autowired

	UserService service;
	@Autowired
	CustomSuccessHandler cust;//

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {// permet de définir les
																					// authentifications à l’application
																					// web (les
//utilisateurs et les rôles)
		PasswordEncoder crt = cryptage();
		auth.userDetailsService(service).passwordEncoder(crt);

	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.formLogin().loginPage("/login").successHandler(cust).permitAll();
		http.logout().logoutSuccessUrl("/login?logout").permitAll();
		http.authorizeRequests().antMatchers("/admin/**").hasRole("ADMIN");
		http.authorizeRequests().antMatchers("/user/**").hasRole("USER");
		http.authorizeRequests().anyRequest().authenticated();
		http.csrf().disable();
	}

	@Bean
	public PasswordEncoder cryptage() {// L’implémentation de PasswordEncoder utilise la fonctionde hachage fort
										// BCrypt.
		return new BCryptPasswordEncoder();// Ce bean sera utiliser pour crypter le mot de passe.
	}
}