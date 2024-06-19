package com.example.btvnbuoi11.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.Date;

@Data
@Entity
@Table(name = "nhan_vien")
public class NhanVien {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "ko dc trong")
    @Column(name = "ma")
    private String ma;

    @NotBlank(message = "ko dc trong")
    @Column(name = "ten")
    private String ten;

    @NotBlank(message = "ko dc trong")
    @Column(name = "ten_dem")
    private String tenDem;

    @NotBlank(message = "ko dc trong")
    @Column(name = "ho")
    private String ho;

    @Column(name = "gioi_tinh")
    private String gioiTinh;

     @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NotNull(message = "ko dc trong")
    @Column(name = "ngay_sinh")
    private Date ngaySinh;

    @Column(name = "dia_chi")
    private String diaChi;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "mat_khau")
    private String matKhau;

    @ManyToOne
    @JoinColumn(name = "id_cua_hang")
    private CuaHang cuaHang;

    @ManyToOne
    @JoinColumn(name = "id_chuc_vu")
    private ChucVu chucVu;

    @Column(name = "trang_thai")
    private Integer trangThai;

}

