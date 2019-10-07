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
import java.io.File;
import java.lang.annotation.Annotation;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
    @RequestMapping(value = "/Inicio", method = RequestMethod.POST)
    public ModelAndView inicioUser(Usuario usuario,HttpSession session) {
        ModelAndView mv = new ModelAndView();
        try {
            //mv.setViewName("InicioBecario");
            UsuarioDAO usuarioDAO = new UsuarioDAO();
            Usuario u = null;
            u=usuarioDAO.find(usuario);
            if(u!=null){
                if(u.getContrasena().equals(usuario.getContrasena())){
                    switch (u.getIdRolUsuario()) {
                        case 1:
                            System.out.println("Administrador");
                            mv.setViewName("InicioAdmin");
                            break;
                        case 2:
                            //EmpresaDAO empresaDAO = new EmpresaDAO();
                            //Empresa empresa = new Empresa();
                            System.out.println("Empresa");
                            mv.setViewName("InicioEmpresa");
                            break;
                        case 3:                        
                            System.out.println("Becario");
                            BecarioDAO becarioDAO = new BecarioDAO();
                            Becario becario=becarioDAO.find(u);
                            if(becario==null){
                                mv.setViewName("index");
                                mv.addObject("errorUsuario", "correo/contraseña incorrecta");
                            }else{
                                /* Obtiene discapacidades */
                                DiscapacidadDAO daoDiscapacidad = new DiscapacidadDAO();
                                Discapacidades d = new Discapacidades();
                                d=daoDiscapacidad.find(becario.getDiscapacidades());
                                becario.setDiscapacidades(d);
                                System.out.println(d.getNombreDiscapacidad());

                                /* Obtiene Grado de estudios */
                                GradoEstudiosDAO geDAO = new GradoEstudiosDAO();
                                Gradoestudios ge = new Gradoestudios();
                                ge=geDAO.find(becario.getGradoestudios());
                                becario.setGradoestudios(ge);
                                System.out.println(becario.getGradoestudios().getNombreGradoEstudios());

                                /* Obtiene direccion */
                                DireccionDAO daoDireccion = new DireccionDAO();
                                Direccion direccion = daoDireccion.find(becario.getDireccion());
                                System.out.println(direccion.getCalle());
                                becario.setDireccion(direccion);
                                
                                
                                mv.addObject("becario",becario);
                                System.out.println(becario.getCurp());
                                session.setAttribute("becario", becario);
                                
                                String path=session.getServletContext().getRealPath("/");
                                path=path.replace("build\\web", "");
                                File directorio=new File(path+"files/"+becario.getCurp());
                                if(directorio.exists()){
                                    mv.addObject("txtDocumentos","Ver mis documentos");
                                    mv.addObject("docFlag",1);
                                }else{
                                    mv.addObject("txtDocumentos","Registrar mis documentos");
                                    mv.addObject("docFlag",0);
                                }
                                mv.setViewName("InicioBecario");
                                return mv;
                            }
                            break;
                        default:
                            break;
                    }
                return mv;
                }else{
                    mv.setViewName("index");
                    mv.addObject("errorContra", "Correo/contraseña incorrectas");
                    return mv;
                }
            }else{
                System.out.println("No hay registro");
                mv.setViewName("index");
                mv.addObject("errorUser", "Correo/contraseña incorrectas o usuario no registrado");
                return mv;
            }
        
        } catch (Exception e) {
        }
        return null;
    }
}
