
package tn.essat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import tn.essat.dao.ICategorie;
import tn.essat.dao.IEmprunt;
import tn.essat.dao.ILivre;
import tn.essat.model.Categorie;
import tn.essat.model.Emprunt;
import tn.essat.model.Livre;
import tn.essat.model.Utilisateur;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AppCRT {


    @Autowired
    ICategorie cat_dao;

    @Autowired
    ILivre liv_dao;

    @Autowired
    IEmprunt emp_dao;

    @GetMapping("/admin/home")
    public String f1(Model m) {
        return "page2";

    }
    @GetMapping("/user/home")
    public String f2(Model m) {
        return "page1";
    }

    @RequestMapping(value = "/login",

            method = {RequestMethod.POST, RequestMethod.GET})

    public String f3(@RequestParam(value = "error", required = false) String error

            , Model model) {

        String msg = null;
        if (error != null) { msg =

                "Username or Password is incorrect !!"; }

        model.addAttribute("errorMessge", msg);
        return "login";
    }
    @GetMapping("/user/categories")
    public String f5(Model m) {
        List <Categorie> cats= cat_dao.findAll();
        m.addAttribute("cats", cats);
        return "page4";

    }
    @GetMapping("/user/livres/{id}")
    public String f6(Model m,@PathVariable int id) {
        Optional<Categorie> cat= cat_dao.findById(id);
        m.addAttribute("cat", cat.get());

        List<Livre> tab= liv_dao.findByCatId(id);

        m.addAttribute("tab", tab);
        return "page5";

    }

    @GetMapping("/emprunt/{id}")
    public String f7(Model m, @PathVariable int id) {
        Optional<Livre> lvOpt = liv_dao.findById(id);

            Livre livre = lvOpt.get();
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Utilisateur u = (Utilisateur) auth.getPrincipal();
            LocalDate now = LocalDate.now();

            Emprunt emp = new Emprunt();
            emp.setUser(u);
            emp.setLv(livre);
            emp.setDate_emprunt(now);

emp_dao.save(emp);
            return "redirect:/user/emprunt";


    }
    @GetMapping("/user/emprunt")
    public String f8(Model m) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Utilisateur u = (Utilisateur) auth.getPrincipal();
        List<Emprunt> liste= emp_dao.getAllEmpruntByUser(u.getId());
        m.addAttribute("liste", liste);

        return "page6";
    }
    // Méthode pour retourner un livre (manquante)
    @GetMapping("/retourner/{id}")
    public String f9(Model m, @PathVariable int id) {
        Optional<Emprunt> empOpt = emp_dao.findById(id);
        if (empOpt.isPresent()) {
            Emprunt emp = empOpt.get();
            emp_dao.delete(emp);
        }
        return "redirect:/user/emprunt";
    }

    // Méthode pour la page d'accueil par défaut
    @GetMapping("/")
    public String home() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
            return "redirect:/admin/home";
        } else {
            return "redirect:/user/home";
        }
    }

    // Méthode pour gérer le logout
    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return "redirect:/login?logout=true";
    }

    // Méthodes pour l'administration
    @GetMapping("/admin/livres")
    public String f10(Model m) {
        List<Livre> livres = liv_dao.findAll();
        m.addAttribute("livres", livres);
        return "page7";
    }

    @GetMapping("/admin/emprunts")
    public String f11(Model m) {
        List<Emprunt> emprunts = emp_dao.findAll();
        m.addAttribute("emprunts", emprunts);
        return "page8";
    }

    @GetMapping("/admin/ajouter-livre")
    public String f12(Model m) {
        List<Categorie> categories = cat_dao.findAll();
        m.addAttribute("categories", categories);
        return "page9";
    }

    @PostMapping("/admin/ajouter-livre")
    public String f13(@ModelAttribute Livre livre, @RequestParam int categorieId) {
        Optional<Categorie> cat = cat_dao.findById(categorieId);
        if (cat.isPresent()) {
            livre.setCat(cat.get());
            liv_dao.save(livre);
        }
        return "redirect:/admin/livres";
    }

    @GetMapping("/admin/supprimer-livre/{id}")
    public String f14(@PathVariable int id) {
        liv_dao.deleteById(id);
        return "redirect:/admin/livres";
    }

    @GetMapping("/admin/retourner-livre/{id}")
    public String f15(@PathVariable int id) {
        Optional<Emprunt> empOpt = emp_dao.findById(id);
        if (empOpt.isPresent()) {
            emp_dao.delete(empOpt.get());
        }
        return "redirect:/admin/emprunts";
    }



}
