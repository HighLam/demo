package com.example.btvnbuoi11.repository;

import com.example.btvnbuoi11.entity.CuaHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CuaHangRepository extends JpaRepository<CuaHang, Long> {
}
