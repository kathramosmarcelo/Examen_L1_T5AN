package com.google.buscador.venta.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.buscador.util.ConectaDB;
import com.google.buscador.venta.bean.ClienteBean;
import com.google.buscador.venta.bean.TipoBean;

public class MySqlClienteDAO implements ClienteDAO{

	@Override
	public int insertaCliente(ClienteBean obj) throws Exception {
		Connection conn = null;
		PreparedStatement pstm = null;
		int insertados = -1;
		try {
			String sql = "insert into tb_cliente values(null,?,?,?,?,?)";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNom_cliente());
			pstm.setString(2, obj.getApe_cliente());
			pstm.setInt(3, obj.getDni_cliente());
			pstm.setString(4, obj.getFec_nac_cliente());
			pstm.setInt(5, obj.getTipo().getCod_tipo());
			
			insertados = pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (pstm != null)pstm.close();
			} catch (SQLException e1) {}
			try {
				if (conn != null)conn.close();
			} catch (SQLException e) {}
		}
		return insertados;
	}

	@Override
	public List<TipoBean> listaTipo() throws Exception {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<TipoBean> lista = new ArrayList<TipoBean>();
		try {
			String sql = "select * from tb_tipo";
			conn = new ConectaDB().getAcceso();
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			TipoBean bean = null;
			while(rs.next()){
				bean = new TipoBean();
				bean.setCod_tipo(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				lista.add(bean);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				if (rs != null)rs.close();
				if (pstm != null)pstm.close();
				if (conn != null)conn.close();
			} catch (SQLException e) {}
		}
		return lista;
	}

	
	
}
