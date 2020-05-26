package com.google.buscador.venta.daos;
 


public class MySqlDAOFActory extends DAOFactory {



	public ClienteDAO getCliente() {
		return new MySqlClienteDAO();
	}
	
	
}
