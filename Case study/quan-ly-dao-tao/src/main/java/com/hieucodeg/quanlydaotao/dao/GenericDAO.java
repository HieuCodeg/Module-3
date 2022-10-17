package com.hieucodeg.quanlydaotao.dao;

import com.hieucodeg.quanlydaotao.mapper.RowMapper;

import java.util.List;

public interface GenericDAO<T> {
	<T> List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters);

	int count(String sql, Object... parameters);

	void update(String sql, Object... parameters);
}