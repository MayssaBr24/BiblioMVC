package tn.essat.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import tn.essat.model.Emprunt;

import java.util.List;

@Repository
public interface IEmprunt extends JpaRepository<Emprunt, Integer>{
    @Query("select e from Emprunt e where e.user.id = ?1")

    List<Emprunt> getAllEmpruntByUser(Integer id);
}
