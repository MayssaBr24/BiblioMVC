package tn.essat.services;

import org.springframework.security.core.userdetails.UserDetailsService;

import tn.essat.model.Utilisateur;

public interface UserService extends UserDetailsService{
Utilisateur findByUsername(String username);
	
	
}
