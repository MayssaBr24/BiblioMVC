package tn.essat.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import tn.essat.dao.IUtilisateur;
import tn.essat.model.Utilisateur;

@Service
public class UserServiceImp implements UserService{
@Autowired
IUtilisateur dao;
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
Utilisateur u = dao.findByUsername(username);
if(u==null) {
	throw new UsernameNotFoundException("user non existant");
	}
return u;
	}

	public Utilisateur findByUsername(String username) {
		return dao.findByUsername(username);
	}

}
