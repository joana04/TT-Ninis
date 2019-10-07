package com.ipn.mx.controller;

import com.ipn.mx.model.dto.Becario;
import com.ipn.mx.model.dao.BecarioDAO;
import com.ipn.mx.model.dto.Direccion;
import com.ipn.mx.model.dao.DireccionDAO;
import com.ipn.mx.model.dao.DiscapacidadDAO;
import com.ipn.mx.model.dao.GradoEstudiosDAO;
import com.ipn.mx.model.dao.UsuarioDAO;
import com.ipn.mx.model.dto.Discapacidades;
import com.ipn.mx.model.dto.Gradoestudios;
import com.ipn.mx.model.dto.Usuario;
import java.lang.annotation.Annotation;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
    @RequestMapping(value = "/MostrarBecariosAdmin", method = RequestMethod.GET)
    public ModelAndView mostrarBecarios() {
        ModelAndView mv = new ModelAndView();
        try {
            BecarioDAO becarioDAO = new BecarioDAO();
            List<Becario> becarios = becarioDAO.findAll();
            System.out.println(becarios);
            mv.addObject("becarios",becarios);
            mv.setViewName("MostrarBecariosAdmin");
            return mv;
        } catch (Exception e) {
        }
        return null;
    }
    
    @RequestMapping(value = "/MostrarBecarioAdmin", method = RequestMethod.GET)
    public ModelAndView mostrarBecario(@RequestParam("id") String curp) {
        ModelAndView mv = new ModelAndView();
        try {
            BecarioDAO becarioDAO = new BecarioDAO();
            Becario becario = new Becario();
            becario.setCurp(curp);
            becario=becarioDAO.find(becario);
            
            /* Obtener la discapacidad del becario */
            DiscapacidadDAO daoDiscapacidad = new DiscapacidadDAO();
            Discapacidades d = new Discapacidades();
            d.setIdDiscapacidad(becario.getDiscapacidades().getIdDiscapacidad());
            d=daoDiscapacidad.find(d);
            
            /* Obtener el grado de estudios del becario */
            GradoEstudiosDAO geDAO = new GradoEstudiosDAO();
            Gradoestudios ge = new Gradoestudios();
            ge.setIdGradoEstudios(becario.getGradoestudios().getIdGradoEstudios());
            ge=geDAO.find(ge);
            
            /* Obtener ubicacion del becario */
            DireccionDAO direccionDAO = new DireccionDAO();
            Direccion direccion = new Direccion();
            direccion=direccionDAO.find(becario.getDireccion());
            
            becario.setDireccion(direccion);
            becario.setDiscapacidades(d);
            becario.setGradoestudios(ge);
            
            /* Obtener el usuario del becario */
            /*UsuarioDAO usuarioDAO = new UsuarioDAO();
            Usuario usuario = new Usuario();
            usuario.setCorreo(becario.getUsuario().getCorreo());
            */
            mv.addObject("becario",becario);
            mv.setViewName("MostrarBecarioAdmin");
            return mv;
        } catch (Exception e) {
        }
        return null;
    }
    
    @RequestMapping(value = "/BorrarBecarioAdmin", method = RequestMethod.GET)
    public ModelAndView borrarBecario(@RequestParam("id") String curp) {
        ModelAndView mv = new ModelAndView();
        try {
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            BecarioDAO becarioDAO = new BecarioDAO();
            Becario becario = new Becario();
            becario.setCurp(curp);
            becario=becarioDAO.find(becario);
            Usuario usuario = becario.getUsuario();
            becarioDAO.delete(becario);
            usuarioDAO.delete(usuario);
            
            mv.setViewName("MostrarBecariosAdmin");
            return mv;
        } catch (Exception e) {
        }
        return null;
    }
    
    @RequestMapping(value = "/InicioAdmin", method = RequestMethod.GET)
    public ModelAndView borrarBecario() {
        ModelAndView mv = new ModelAndView();
        try {
            mv.setViewName("InicioAdmin");
            return mv;
        } catch (Exception e) {
        }
        return null;
    }
    
    
}
