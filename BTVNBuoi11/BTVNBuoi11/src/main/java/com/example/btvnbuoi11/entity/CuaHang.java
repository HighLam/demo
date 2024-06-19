package com.example.btvnbuoi11.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "cua_hang")
public class CuaHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ma")
    private String ma;

    @Column(name = "ten")
    private String ten;

    @Column(name = "dia_chi")
    private String diaChi;

    @Column(name = "thanh_pho")
    private String thanhPho;

    @Column(name = "quoc_giaf")
    private String quocGia;
}
