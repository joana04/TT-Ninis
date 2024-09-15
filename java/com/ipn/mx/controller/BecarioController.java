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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("becario")
public class BecarioController {
    @RequestMapping(value = "/InicioBecario", method = RequestMethod.GET)
    public ModelAndView inicioBecario(Becario becario, HttpSession session) {
        ModelAndView mv = new ModelAndView();
        try {   
            session.setAttribute("becario", becario);
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
            
            /* Verifica si ya se registraron los documentos */
            String path=session.getServletContext().getRealPath("/");
            path=path.replace("build\\web", "");
            File directorio=new File(path+"files/"+becario.getCurp());
            if(directorio.exists()){
                System.out.println("Existe");
                path=path.replace("file:///", "");
                path=path.replace("//", "/");
                mv.addObject("txtDocumentos","Ver mis documentos");
                mv.addObject("docFlag",1);
                
            }else{
                mv.addObject("txtDocumentos","Registrar mis documentos");
                mv.addObject("docFlag",0);
            }
            
            
            mv.addObject("becario", becario);
            mv.setViewName("InicioBecario");
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
    
    @RequestMapping(value = "/AgregarDocumentosBecario", method = RequestMethod.GET)
    public ModelAndView agregarDocumentos(Becario becario,HttpSession session) {
        ModelAndView mv = new ModelAndView();
        try {
            mv.addObject("becario",becario);
            BecarioDAO dao = new BecarioDAO();
            int idDireccion = dao.find(becario).getDireccion().getIdDireccion();
            DireccionDAO daoDireccion = new DireccionDAO();
            Direccion direccion = new Direccion();
            direccion.setIdDireccion(idDireccion);
            direccion=daoDireccion.find(direccion);
            
            return mv;
        } catch (Exception ex) {
         
        }
        return null;
    }

    
    @RequestMapping(value="/savefileBecario",method=RequestMethod.POST)  
    public ModelAndView upload(@RequestParam CommonsMultipartFile file,
        @RequestParam CommonsMultipartFile domicilio,
        @RequestParam CommonsMultipartFile estudios,
        @RequestParam CommonsMultipartFile acta,
        HttpSession session,Becario becario){  
        ModelAndView mv = new ModelAndView();
        String path=session.getServletContext().getRealPath("/");
        path=path.replace("build\\web", "");
        File directorio=new File(path+"files/"+becario.getCurp());
        directorio.mkdirs();
        path=path + "files\\"+becario.getCurp();
        String filename=file.getOriginalFilename();  
        String filename2=domicilio.getOriginalFilename();
        //String ext=file.getOriginalFilename().split(".")[0];
        System.out.println(path+" "+filename);  
        try{  
            /*  GUARDAR CURP  */
            byte barr[]=file.getBytes();  
            BufferedOutputStream bout=new BufferedOutputStream(
                new FileOutputStream(path+"/curp.pdf"));  
                //new FileOutputStream(path+"/"+filename));  
                System.out.println(path);
            bout.write(barr);  
            bout.flush();  
            bout.close(); 

            /*  GUARDAR COMPROBANTE DE DOMICILIO  */
            byte barr2[]=domicilio.getBytes();
            bout=new BufferedOutputStream(
                new FileOutputStream(path+"/domicilio.pdf"));  
                //new FileOutputStream(path+"/"+filename));  
            System.out.println(path);
            bout.write(barr2);  
            bout.flush();  
            bout.close();
            
            /*  GUARDAR COMPROBNTE DE ESTUDIOS  */
            byte barr3[]=estudios.getBytes();
            bout=new BufferedOutputStream(
                new FileOutputStream(path+"/estudios.pdf"));  
                //new FileOutputStream(path+"/"+filename));  
            System.out.println(path);
            bout.write(barr3);  
            bout.flush();  
            bout.close();
            
            /*  GUARDAR ACTA DE NACIMIENTO  */
            byte barr4[]=acta.getBytes();
            bout=new BufferedOutputStream(
                new FileOutputStream(path+"/acta.pdf"));  
                //new FileOutputStream(path+"/"+filename));  
            System.out.println(path);
            bout.write(barr4);  
            bout.flush();
            bout.close();
            
            /* Mensaje para inicio*/
            mv.addObject("txtDocumentos","Ver mis documentos");
            mv.addObject("docFlag",1);
            mv.setViewName("InicioBecario");
            
        }catch(Exception e){System.out.println(e);}  
        return mv;
    } 
    
    @RequestMapping(value = "/closeSession")
    public String closeSession(SessionStatus status) {
        status.setComplete();
        return "lastpage";
    }
    
    @RequestMapping(value = "/MostrarArchivo", method = RequestMethod.GET)
    public ModelAndView mostrarArchivo(@RequestParam("id") String id,
            @RequestParam("file") String file,
            HttpSession session,
            HttpServletResponse response) throws FileNotFoundException, IOException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("MostrarArchivo");
        System.out.println("estamos en el get de OpenPdf");
        String path=session.getServletContext().getRealPath("/");
            path=path.replace("build\\web", "");
            path=path+"files/"+id+"/"+file+".pdf";
            //File directorio=new File(path+"files/"+id);
        try (FileInputStream ficheroInput = new FileInputStream(path)){//"C:\\Users\\lm107\\Documents\\NetBeansProjects\\TTVinculacionLaboral\\files\\AUPL970715HMCBRS07\\curp.pdf")) {
            int tamanoInput = ficheroInput.available();
            byte[] datosPDF = new byte[tamanoInput];
            ficheroInput.read( datosPDF, 0, tamanoInput);
            
            response.setHeader("Content-disposition","inline; filename=instalacion_tomcat.pdf" );
            response.setContentType("application/pdf");
            response.setContentLength(tamanoInput);
            response.getOutputStream().write(datosPDF);
        }
        
        return mv;
    }
    
    private void userSession(Usuario u,HttpSession sesion){
        sesion.setAttribute("user", u);
    }
}
