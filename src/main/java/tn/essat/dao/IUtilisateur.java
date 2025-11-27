package tn.essat.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import tn.essat.model.Utilisateur;

public interface IUtilisateur extends JpaRepository<Utilisateur, Integer>{
	
public Utilisateur findByUsername(String username);
}
