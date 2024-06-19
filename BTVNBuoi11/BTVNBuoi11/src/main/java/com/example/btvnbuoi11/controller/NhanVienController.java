package com.example.btvnbuoi11.controller;

import com.example.btvnbuoi11.entity.NhanVien;
import com.example.btvnbuoi11.repository.ChucVuRepository;
import com.example.btvnbuoi11.repository.CuaHangRepository;
import com.example.btvnbuoi11.repository.NhanVienRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.swing.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/nhan-vien")
public class NhanVienController {

    @Autowired
    private NhanVienRepository nhanVienRepository;
    @Autowired
    private ChucVuRepository chucVuRepository;

    @Autowired
    private CuaHangRepository cuaHangRepository;
    @GetMapping("/hien-thi")
    public String hienThi(@RequestParam(value = "currentPage",defaultValue = "0") Integer currentPage, Model model) {
        Pageable pageable= PageRequest.of(currentPage,5);
        Page<NhanVien> list= nhanVienRepository.findAll(pageable);
        model.addAttribute("list", list);
        model.addAttribute("listChucVu", chucVuRepository.findAll());
        model.addAttribute("listCuaHang", cuaHangRepository.findAll());
        model.addAttribute("nhanVien", new NhanVien());
        return "home";
    }

    @ResponseBody
    @GetMapping("/phantrang")
    public Page<NhanVien> phantrang(@RequestParam(value = "currentPage",defaultValue = "0") Integer currentPage, Model model) {
        Pageable pageable= PageRequest.of(currentPage,5);
        Page<NhanVien> list= nhanVienRepository.findAll(pageable);
        return list;
    }

    @PostMapping("/add")
    public String add(@Valid NhanVien nhanVien, BindingResult bindingResult,  RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            Map<String,String> map = new HashMap<>();
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            redirectAttributes.addFlashAttribute("err", map);
        }else {
            nhanVienRepository.save(nhanVien);
        }
        return "redirect:/nhan-vien/hien-thi";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam(value = "id", required = false) Long id, RedirectAttributes redirectAttributes) {
        nhanVienRepository.deleteById(id);
        return "redirect:/nhan-vien/hien-thi";
    }

    @GetMapping("/view/update")
    public String viewUpdate(@RequestParam(value = "id", required = false) Long id,Model model) {
        model.addAttribute("listChucVu", chucVuRepository.findAll());
        model.addAttribute("listCuaHang", cuaHangRepository.findAll());
        model.addAttribute("detail", nhanVienRepository.findById(id).get());
        return "update";
    }
}
