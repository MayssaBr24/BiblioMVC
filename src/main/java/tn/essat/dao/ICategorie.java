package tn.essat.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import net.bytebuddy.implementation.bytecode.constant.IntegerConstant;
import tn.essat.model.Categorie;
import tn.essat.model.Emprunt;

@Repository
public interface ICategorie extends JpaRepository<Categorie, Integer>{

}
