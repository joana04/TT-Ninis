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
@SessionAttributes("becario")
public class BecarioController {
    @RequestMapping(value = "/InicioBecario", method = RequestMethod.GET)
    public ModelAndView inicioBecario(Becario becario) {
        ModelAndView mv = new ModelAndView();
        try {
            mv.setViewName("InicioBecario");
            DiscapacidadDAO daoDiscapacidad = new DiscapacidadDAO();
            Discapacidades d = new Discapacidades();
            d.setIdDiscapacidad(becario.getDiscapacidades().getIdDiscapacidad());
            d=daoDiscapacidad.find(d);
            mv.addObject("discapacidadNombre",d.getNombreDiscapacidad());
            GradoEstudiosDAO geDAO = new GradoEstudiosDAO();
            Gradoestudios ge = new Gradoestudios();
            ge.setIdGradoEstudios(becario.getGradoestudios().getIdGradoEstudios());
            ge=geDAO.find(ge);
            mv.addObject("gradoEstudiosNombre",ge.getNombreGradoEstudios());
            BecarioDAO dao = new BecarioDAO();
            int idDireccion = dao.find(becario).getDireccion().getIdDireccion();
            DireccionDAO daoDireccion = new DireccionDAO();
            Direccion direccion = new Direccion();
            direccion.setIdDireccion(idDireccion);
            direccion=daoDireccion.find(direccion);
            mv.addObject("direccion",direccion);
            return mv;
        } catch (Exception e) {
        }
        return null;
    }
    
    @RequestMapping(value = "/AgregarBecario", method = RequestMethod.GET)
    public ModelAndView agregarBecario() {
        ModelAndView mv = new ModelAndView();
        try {
            mv.addObject(new Becario());
            mv.setViewName("AgregarBecario");
            return mv;
        } catch (Exception e) {
        }
        return null;
    }
    
    @RequestMapping(value = "/addBecario", method = RequestMethod.POST)
    public ModelAndView agregarBecario(Becario becario, 
            @RequestParam("correo") String correo,
            @RequestParam("password") String password,
            @RequestParam("idDiscapacidad") int idDiscapacidad,
            @RequestParam("idGradoEstudios") int idGradoEstudios) {
        ModelAndView mv = new ModelAndView();
        boolean duplicateFlag=false;
        try {
            UsuarioDAO daoUsuario = new UsuarioDAO();
            Usuario u = new Usuario();
            u.setCorreo(correo);
            BecarioDAO dao = new BecarioDAO();
            if(daoUsuario.find(u)!=null){
                mv.setViewName("AgregarBecario");
                mv.addObject("errorCorreo","Correo registrado.");
                becario.setUsuario(new Usuario(correo));
                mv.addObject("becario",becario);
                mv.addObject("idDiscapacidad",idDiscapacidad);
                mv.addObject("idGradoEstudios",idGradoEstudios);
                return mv;
            }
            if(dao.find(becario)!=null){
                mv.setViewName("AgregarBecario");
                mv.addObject("errorCURP","CURP registrado");
                becario.setUsuario(new Usuario(correo));
                mv.addObject("becario",becario);
                mv.addObject("idDiscapacidad",idDiscapacidad);
                mv.addObject("idGradoEstudios",idGradoEstudios);
                return mv;
            }
            u.setCorreo(correo);
            u.setContrasena(password);
            u.setIdRolUsuario(3);
            daoUsuario.create(u);
            u=daoUsuario.find(u);
            becario.setUsuario(u);
            GradoEstudiosDAO daoGE= new GradoEstudiosDAO();
            Gradoestudios ge=new Gradoestudios();
            ge.setIdGradoEstudios(idGradoEstudios);
            daoGE.find(ge);
            becario.setGradoestudios(ge);
            DiscapacidadDAO daoDiscapacidad=new DiscapacidadDAO();
            Discapacidades d = new Discapacidades();
            d.setIdDiscapacidad(idDiscapacidad);
            becario.setDiscapacidades(d);
            dao.create(becario);
            mv.addObject(becario);
            mv.setViewName("AgregarBecarioUbicacion");
            return mv;
        } catch (Exception ex) {
         
        }
        return null;
    }
    
    @RequestMapping(value = "/AgregarUbicacionBecario", method = RequestMethod.POST)
    public ModelAndView agregarUbicacionBecario(Becario becario) {
        ModelAndView mv = new ModelAndView();
        try {
            mv.addObject("becario",becario);
            mv.addObject(new Direccion());
            mv.setViewName("AgregarBecarioUbicacion");
            return mv;
        } catch (Exception ex) {
         
        }
        return null;
    }
    
    @RequestMapping(value = "/addDireccion")
    public String addDireccion(Direccion direccion,@RequestParam("curp") String curp) {
        ModelAndView mv = new ModelAndView();
        try {
            DireccionDAO daoDireccion = new DireccionDAO();
            daoDireccion.create(direccion);
            System.out.println(curp);
            BecarioDAO becarioDAO = new BecarioDAO();
            Becario becario = new Becario();
            becario.setCurp(curp);
            becario=becarioDAO.find(becario);
            becario.setDireccion(direccion);
            becarioDAO.update(becario);
            mv.addObject("becario",becario);
            return "redirect:/InicioBecario.htm";
        } catch (Exception ex) {
         
        }
        return null;
    }
    
    @RequestMapping(value = "/VerInfoBecario", method = RequestMethod.GET)
    public ModelAndView verInfoBecario(Becario becario) {
        ModelAndView mv = new ModelAndView();
        try {
            mv.addObject("becario",becario);
            DiscapacidadDAO daoDiscapacidad = new DiscapacidadDAO();
            Discapacidades d = new Discapacidades();
            d.setIdDiscapacidad(becario.getDiscapacidades().getIdDiscapacidad());
            d=daoDiscapacidad.find(d);
            mv.addObject("discapacidadNombre",d.getNombreDiscapacidad());
            GradoEstudiosDAO geDAO = new GradoEstudiosDAO();
            Gradoestudios ge = new Gradoestudios();
            ge.setIdGradoEstudios(becario.getGradoestudios().getIdGradoEstudios());
            ge=geDAO.find(ge);
            mv.addObject("gradoEstudiosNombre",ge.getNombreGradoEstudios());
            
            mv.setViewName("VerInfoBecario");
            return mv;
        } catch (Exception ex) {
         
        }
        return null;
    }
    
    @RequestMapping(value = "/VerUbicacionBecario", method = RequestMethod.GET)
    public ModelAndView verUbicacionBecario(Becario becario) {
        ModelAndView mv = new ModelAndView();
        try {
            mv.addObject("becario",becario);
            BecarioDAO dao = new BecarioDAO();
            int idDireccion = dao.find(becario).getDireccion().getIdDireccion();
            DireccionDAO daoDireccion = new DireccionDAO();
            Direccion direccion = new Direccion();
            direccion.setIdDireccion(idDireccion);
            direccion=daoDireccion.find(direccion);
            mv.addObject("direccion",direccion);
            mv.setViewName("VerUbicacionBecario");
            return mv;
        } catch (Exception ex) {
         
        }
        return null;
    }
    
    @RequestMapping(value = "/EditarBecario", method = RequestMethod.GET)
    public ModelAndView editarBecario(Becario becario) {
        ModelAndView mv = new ModelAndView();
        try {
            mv.addObject("becario",becario);
            mv.addObject("idDiscapacidad",becario.getDiscapacidades().getIdDiscapacidad());
            mv.addObject("idGradoEstudios",becario.getGradoestudios().getIdGradoEstudios());
            mv.setViewName("EditarBecario");
            return mv;
        } catch (Exception ex) {
         
        }
        return null;
    }
    
    @RequestMapping(value = "/editBecario", method = RequestMethod.POST)
    public ModelAndView editBecario(Becario becario, 
            int idDiscapacidad,
            int idGradoEstudios) {
        ModelAndView mv = new ModelAndView();
        boolean duplicateFlag=false;
        try {
            UsuarioDAO daoUsuario = new UsuarioDAO();
            Usuario u = new Usuario();
            BecarioDAO daoBecario = new BecarioDAO();
            List<Becario> becarios = daoBecario.findAll();
            boolean flagCurp=false;
            for (Becario b : becarios) {
                if(b.getCurp().equals(becario.getCurp()) && !b.getUsuario().getCorreo().equals(becario.getUsuario().getCorreo()))
                    flagCurp=true;
            }
            
            if(flagCurp){
                mv.setViewName("EditarBecario");
                mv.addObject("errorCURP","CURP registrado");
                mv.addObject("becario",becario);
                mv.addObject("idDiscapacidad",idDiscapacidad);
                mv.addObject("idGradoEstudios",idGradoEstudios);
                return mv;
            }
            GradoEstudiosDAO daoGE= new GradoEstudiosDAO();
            Gradoestudios ge=new Gradoestudios();
            ge.setIdGradoEstudios(idGradoEstudios);
            daoGE.find(ge);
            becario.setGradoestudios(ge);
            DiscapacidadDAO daoDiscapacidad=new DiscapacidadDAO();
            Discapacidades d = new Discapacidades();
            d.setIdDiscapacidad(idDiscapacidad);
            becario.setDiscapacidades(d);
            daoBecario.update(becario);
            mv.addObject(becario);
            mv.setViewName("InicioBecario");
            return mv;
        } catch (Exception ex) {
         
        }
        return null;
    }
    
    @RequestMapping(value = "/EditarBecarioUbicacion", method = RequestMethod.GET)
    public ModelAndView editarBecarioUbicacion(Becario becario) {
        ModelAndView mv = new ModelAndView();
        try {
            mv.addObject("becario",becario);
            BecarioDAO dao = new BecarioDAO();
            int idDireccion = dao.find(becario).getDireccion().getIdDireccion();
            DireccionDAO daoDireccion = new DireccionDAO();
            Direccion direccion = new Direccion();
            direccion.setIdDireccion(idDireccion);
            direccion=daoDireccion.find(direccion);
            mv.addObject("direccion",direccion);
            mv.setViewName("EditarBecarioUbicacion");
            return mv;
        } catch (Exception ex) {
         
        }
        return null;
    }
    
    @RequestMapping(value = "/editBecarioUbicacion", method = RequestMethod.POST)
    public String editBecarioUbicacion(Becario becario,Direccion direccion) {
        try {
            DireccionDAO daoDireccion = new DireccionDAO();
            BecarioDAO daoBecario = new BecarioDAO();
            Integer idDireccion;
                if(becario.getDireccion()==null){
                    System.out.println("if\n\n\n\n");
                    daoDireccion.create(direccion);
                    idDireccion=daoDireccion.getLastDireccion();
                    direccion.setIdDireccion(idDireccion);
                    daoDireccion.find(direccion);
                }else{
                    System.out.println("ELSE\n\n\n\n");
                    idDireccion=daoBecario.find(becario).getDireccion().getIdDireccion();
                    direccion.setIdDireccion(idDireccion);
                    daoDireccion.update(direccion);
                }
                becario.setDireccion(direccion);
                daoBecario.update(becario);
                
            return "redirect:/InicioBecario.htm";
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    @RequestMapping(value = "/closeSession")
    public String closeSession(SessionStatus status) {
        status.setComplete();
        return "lastpage";
    }
    
    private void userSession(Usuario u,HttpSession sesion){
        sesion.setAttribute("user", u);
    }
}
