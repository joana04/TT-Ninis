package com.ipn.mx.controller;

import com.ipn.mx.model.dto.Empresa;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmpresaController {
    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public ModelAndView dashboard() {
        ModelAndView mv = new ModelAndView("dashboard");
        try {
            //List<Empresa> empresas = new EmpresaDAO().findAll();
            //mv.addObject("Empresas",empresas);
            return mv;
        } catch (Exception e) {
        }
        return null;
    }
    
    @RequestMapping(value = "/MostrarEmpresas", method = RequestMethod.GET)
    public ModelAndView showEmpresas() {
        /*ModelAndView mv = new ModelAndView("MostrarEmpresas");
        try {
            List<Empresa> empresas = new EmpresaDAO().findAll();
            mv.addObject("Empresas",empresas);
            return mv;
        } catch (Exception e) {
        }*/
        return null;
    }
    
    @RequestMapping(value = "/MostrarEmpresa", method = RequestMethod.GET)
    public ModelAndView showEmpresa(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("MostrarEmpresa");
        try {
            String rfc=request.getParameter("id");
            //Empresa e = new Empresa(rfc,"","",0);
            //e.setRfc(rfc);
            //Empresa empresa = new EmpresaDAO().find(e);
            //mv.addObject("empresa",empresa);
            return mv;
        } catch (Exception e) {
        }
        return null;
    }
    
    @RequestMapping(value = "/AgregarEmpresa", method = RequestMethod.GET)
    public ModelAndView agregarEmpresa() {
        ModelAndView mv = new ModelAndView();
        try {
            mv.addObject(new Empresa());
            //mv.setViewName("AgregarEmpresa.htm");
            return mv;
        } catch (Exception e) {
        }
        return null;
    }
    
    @RequestMapping(value = "/addEmpresa", method = RequestMethod.POST)
    public String agregarEmpresa(Empresa e) {
        /*try {
            EmpresaDAO dao = new EmpresaDAO();
            dao.create(e);
            return "redirect:/MostrarEmpresas.htm";
        } catch (Exception ex) {
         
        }*/
        return null;
    }
    
    @RequestMapping(value = "/EditarEmpresa", method = RequestMethod.GET)
    public ModelAndView editarEmpresa(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        try {
            String rfc=request.getParameter("id");
            //EmpresaDAO dao = new EmpresaDAO();
            //Empresa e=new Empresa(rfc,"","",0);
            //e=dao.find(e);
            //mv.addObject("e",e);
            //mv.setViewName("AgregarEmpresa.htm");
            return mv;
        } catch (Exception e) {
        }
        return null;
    }
    
    @RequestMapping(value = "/editEmpresa", method = RequestMethod.POST)
    public String editarEmpresa(Empresa e) {
        /*try {
            EmpresaDAO dao = new EmpresaDAO();
            dao.update(e);
            return "redirect:/MostrarEmpresas.htm";
        } catch (Exception ex) {
         
        }*/
        return null;
    }
    
    @RequestMapping(value = "/deleteEmpresa")
    public ModelAndView eliminarEmpresa(HttpServletRequest request) {
        /*try {
            EmpresaDAO dao = new EmpresaDAO();
            Empresa e = new Empresa();
            e.setRfc(request.getParameter("id"));
            e=dao.find(e);
            dao.delete(e);
            return new ModelAndView("redirect:/MostrarEmpresas.htm");
        } catch (Exception ex) {
         
        }*/
        return null;
    }
}
