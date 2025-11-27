package tn.essat.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import tn.essat.model.Livre;

import java.util.List;

@Repository
public interface ILivre extends JpaRepository<Livre, Integer> {

    @Query("SELECT l FROM Livre l WHERE l.cat.id = ?1")
    List<Livre> findByCatId(Integer id);

}


